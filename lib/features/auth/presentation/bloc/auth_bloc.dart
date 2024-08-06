import 'dart:async';
import 'package:country_picker/country_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/common/models/page_state/bloc_status.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/core/utils/custom_validators.dart';
import 'package:werewolf_cars/core/utils/nullable.dart';
import 'package:werewolf_cars/features/app/domin/repositories/prefs_repository.dart';
import 'package:werewolf_cars/features/app/presentation/bloc/app_manager_cubit.dart';
import 'package:werewolf_cars/features/auth/data/models/authorization_response.dart';
import 'package:werewolf_cars/features/auth/data/models/customer_info.dart';
import 'package:werewolf_cars/features/auth/domain/use_cases/reset_password_generate_usecase.dart';
import 'package:werewolf_cars/features/auth/domain/use_cases/logout_usecase.dart';
import 'package:werewolf_cars/features/auth/domain/use_cases/register_usecase.dart';
import 'package:werewolf_cars/features/auth/domain/use_cases/resend_code_usecase.dart';
import 'package:werewolf_cars/features/auth/domain/use_cases/reset_password_usecase.dart';
import 'package:werewolf_cars/features/auth/domain/use_cases/verification_usecase.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../../common/helpers/helper_functions.dart';
import '../../../../services/firebase_service.dart';
import '../../domain/use_cases/login_usecase.dart';
import '../../domain/use_cases/reset_password_check_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class PhoneNumberValidator extends Validator<dynamic> {
  final String phoneControlName;
  final String countryCodeControlName;

  const PhoneNumberValidator(this.phoneControlName, this.countryCodeControlName)
      : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final error = {ValidationMessage.number: true};

    if (control is! FormGroup) {
      return error;
    }

    final phoneControl = control.control(phoneControlName);
    final countryCodeControl = control.control(countryCodeControlName);

    final phone = phoneControl.value as String?;
    final countryCode = countryCodeControl.value as String?;

    if (phone != null && countryCode != null) {
      final country = CountryParser.tryParsePhoneCode(countryCode)!;
      final iso = isoCodeConversionMap[country.countryCode]!;

      final phoneNumber = PhoneNumber(nsn: phone, isoCode: iso);
      final isValid = phoneNumber.isValid();

      if (!isValid) {
        phoneControl.setErrors(error);
        phoneControl.markAsTouched();
      } else {
        phoneControl.removeError(ValidationMessage.number);
      }
    }

    return null;
  }
}

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._registerUsecase,
    this._loginUsecase,
    this._logoutUsecase,
    this._resetPasswordUsecase,
    this._resetPasswordGenerateUsecase,
    this._resetPasswordCheckUsecase,
    this._verificationUsecase,
    this._resendCodeUsecase,
    this._appManagerCubit,
    this._prefsRepository,
  ) : super(AuthState()) {
    on<RegisterEvent>(_onRegisterEvent);
    // on<LoginEvent>(_onLoginEvent);
    on<LogoutEvent>(_onLogoutEvent);
    on<ResetPasswordEvent>(_onResetPasswordEvent);
    on<ResetPasswordGenerateEvent>(_onResetPasswordGenerateEvent);
    on<ResetPasswordCheckEvent>(_onResetPasswordCheckEvent);
    // on<VerificationEvent>(_onVerificationEvent);
    on<ResendCodeEvent>(_onResendCodeEvent);
    on<ChangeCountryEvent>(_onChangeCountryEvent);
  }

  final LoginUsecase _loginUsecase;
  final LogoutUsecase _logoutUsecase;
  final RegisterUsecase _registerUsecase;
  final ResetPasswordUsecase _resetPasswordUsecase;
  final ResetPasswordGenerateUsecase _resetPasswordGenerateUsecase;
  final ResetPasswordCheckUsecase _resetPasswordCheckUsecase;
  final ResendCodeUsecase _resendCodeUsecase;
  final VerificationUsecase _verificationUsecase;
  final AppManagerCubit _appManagerCubit;
  final PrefsRepository _prefsRepository;
  final String kFromPhone = 'phone';
  final String kFromPassword = 'password';
  final String kFromConfirmationPassword = 'confirmationPassword';
  final String kFromName = 'name';
  final String kFromCountryCode = 'countryCode';

  static final initCountry = CountryParser.parsePhoneCode('966');
  late final singUpForm = FormGroup(
    {
      kFromName: FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      kFromCountryCode: FormControl<String>(validators: [Validators.required]),
      kFromPhone: FormControl<String>(
        validators: [
          Validators.required,
          // const PhoneNumberValidator(),
        ],
      ),
      kFromPassword: FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(8),
        ],
      ),
      kFromPassword: FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(8),
        ],
      ),
      kFromConfirmationPassword: FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(8),
        ],
      ),
    },
    validators: [
      Validators.mustMatch(kFromPassword, kFromConfirmationPassword),
      PhoneNumberValidator(kFromPhone, kFromCountryCode),
    ],
  );
  late final loginForm = FormGroup({
    kFromPhone: FormControl<String>(
      validators: [
        Validators.required,
        // const PhoneNumberValidator(),
      ],
    ),
    kFromPassword: FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(8),
      ],
    ),
    kFromCountryCode: FormControl<String>(validators: [Validators.required]),
  }, validators: [
    PhoneNumberValidator(kFromPhone, kFromCountryCode),
  ]);

  late final resetPasswordForm = FormGroup(
    {
      kFromPassword: FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(8),
        ],
      ),
      kFromConfirmationPassword: FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(8),
        ],
      ),
    },
    validators: [
      Validators.mustMatch(kFromPassword, kFromConfirmationPassword),
    ],
  );

  FutureOr<void> _onRegisterEvent(
      RegisterEvent event, Emitter<AuthState> emit) async {
    if (singUpForm.invalid) {
      singUpForm.markAllAsTouched();
      return;
    }

    emit(state.copyWith(registerStatus: const BlocStatus.loading()));

    final registerParams = RegisterParams(
        name: singUpForm.control(kFromName).value,
        phone: signUpPhoneNumber,
        password: singUpForm.control(kFromPassword).value,
        passwordConfirmation:
            singUpForm.control(kFromConfirmationPassword).value);

    final response = await _registerUsecase(registerParams);

    response.fold(
      (exception, message) async =>
          emit(state.copyWith(registerStatus: BlocStatus.fail(error: message))),
      (value) async {
        event.onSuccess.call();

        emit(state.copyWith(
          registerStatus: const BlocStatus.success(),
          phone: singUpForm.control(kFromPhone).value,
        ));
      },
    );
  }

  String get signUpPhoneNumber {
    final phone = singUpForm.control(kFromPhone).value;
    return "+${state.selectedCountry.phoneCode}$phone";
  }

  // FutureOr<void> _onLoginEvent(
  //     LoginEvent event, Emitter<AuthState> emit) async {
  //   if (loginForm.invalid) {
  //     loginForm.markAllAsTouched();
  //     return;
  //   }
  //   final fcm = await FirebaseService.getFcmToken();

  //   emit(state.copyWith(loginStatus: const BlocStatus.loading()));

  //   final loginParams = LoginParams(
  //     phone: loginPhoneNumber,
  //     password: loginForm.control(kFromPassword).value,
  //     fcm: fcm,
  //   );

  //   final response = await _loginUsecase(loginParams);

  //   await response.fold(
  //     (exception, message) async =>
  //         emit(state.copyWith(loginStatus: BlocStatus.fail(error: message))),
  //     (value) async {
  //       emit(state.copyWith(
  //         loginStatus: const BlocStatus.success(),
  //         phone: loginForm.control(kFromPhone).value,
  //         hasAccountNotVerified: value.data!.customer.phoneVerifiedAt == null,
  //       ));
  //       await _prefsRepository.setCustomer(value.data!);

  //       loginForm
  //         ..value = {
  //           kFromPhone: "",
  //           kFromPassword: "",
  //         }
  //         ..markAsUntouched();
  //       _appManagerCubit.checkUser();

  //       event.onSuccess(value.data!);
  //     },
  //   );
  // }

  // FutureOr<void> _onVerificationEvent(
  //     VerificationEvent event, Emitter<AuthState> emit) async {
  //   emit(state.copyWith(verificationStatus: const BlocStatus.loading()));

  //   final response = await _verificationUsecase(
  //       VerificationParams(code: event.code, phone: event.phone));

  //   response.fold(
  //     (exception, message) => emit(
  //         state.copyWith(verificationStatus: BlocStatus.fail(error: message))),
  //     (value) {
  //       event.onSuccess.call();

  //       emit(state.copyWith(
  //         verificationStatus: const BlocStatus.success(),
  //         // phone: loginForm.control(kFromPhone).value,
  //       ));
  //     },
  //   );
  // }

  String get loginPhoneNumber {
    final phone = loginForm.control(kFromPhone).value;
    return "+${state.selectedCountry.phoneCode}$phone";
  }

  FutureOr<void> _onResendCodeEvent(
      ResendCodeEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(resendCodeStatus: const BlocStatus.loading()));

    final phone = "+${state.selectedCountry.phoneCode}${state.phone!}";
    final response = await _resendCodeUsecase(ResendCodeParams(phone: phone));

    response.fold(
      (exception, message) => emit(
          state.copyWith(resendCodeStatus: BlocStatus.fail(error: message))),
      (value) =>
          emit(state.copyWith(resendCodeStatus: const BlocStatus.success())),
    );
  }

  FutureOr<void> _onLogoutEvent(
      LogoutEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(logoutStatus: const BlocStatus.loading()));

      final response = await _logoutUsecase();
      if (response.isFailure) {
        emit(state.copyWith(
            logoutStatus:
                BlocStatus.fail(error: response.getFailureOrNull?.message)));
      } else {
        await HelperFunctions.instance.logout().then((value) =>
            GRouter.router.goNamed(GRouter.config.krpOnboardingRoutePath));

        emit(state.copyWith(logoutStatus: const BlocStatus.success()));
      }
    } catch (e) {
      emit(state.copyWith(logoutStatus: const BlocStatus.fail(error: null)));
      debugPrint(e.toString());
    }
  }

  FutureOr<void> _onResetPasswordEvent(
      ResetPasswordEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(resetPasswordStatus: const BlocStatus.loading()));

    final response = await _resetPasswordUsecase(ResetPasswordParams(
        password: resetPasswordForm.control(kFromPassword).value,
        passwordConfirmation:
            resetPasswordForm.control(kFromConfirmationPassword).value,
        authorizationResponse: state.authorizationResponse!));
    print(state.authorizationResponse!.signature);

    response.fold(
      (exception, message) => emit(
          state.copyWith(resetPasswordStatus: BlocStatus.fail(error: message))),
      (value) {
        emit(state.copyWith(resetPasswordStatus: const BlocStatus.success()));
        event.onSuccess();
      },
    );
  }

  FutureOr<void> _onResetPasswordGenerateEvent(
      ResetPasswordGenerateEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
        resetPasswordGenerateStatus: const BlocStatus.loading()));

    final response = await _resetPasswordGenerateUsecase(
        ResetPasswordGenerateParams(phone: loginPhoneNumber));

    response.fold(
      (exception, message) => emit(state.copyWith(
          resetPasswordGenerateStatus: BlocStatus.fail(error: message))),
      (value) => emit(state.copyWith(
          resetPasswordGenerateStatus: const BlocStatus.success())),
    );
  }

  FutureOr<void> _onResetPasswordCheckEvent(
      ResetPasswordCheckEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(resetPasswordCheckStatus: const BlocStatus.loading()));

    final response = await _resetPasswordCheckUsecase(
        ResetPasswordCheckParams(token: event.token, phone: event.phone));

    response.fold(
      (exception, message) => emit(state.copyWith(
          resetPasswordCheckStatus: BlocStatus.fail(error: message))),
      (value) {
        emit(state.copyWith(
            authorizationResponse: value.data,
            resetPasswordCheckStatus: const BlocStatus.success()));
        event.onSuccess.call();
      },
    );
  }

  FutureOr<void> _onChangeCountryEvent(
      ChangeCountryEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(selectedCountry: Nullable.value(event.country)));
  }
}
