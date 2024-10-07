import 'dart:async';
import 'dart:io';
import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:werewolf_cars/common/models/page_state/bloc_status.dart';
import 'package:werewolf_cars/common/models/page_state/page_state.dart';
import 'package:werewolf_cars/core/api/api_utils.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/features/app/domin/repositories/prefs_repository.dart';
import 'package:werewolf_cars/features/app/presentation/bloc/app_manager_cubit.dart';
import 'package:werewolf_cars/features/auth/data/models/customer_info.dart';
import 'package:werewolf_cars/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:werewolf_cars/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:werewolf_cars/generated/locale_keys.g.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../../core/utils/nullable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

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
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(
    this._appManagerCubit,
  ) : super(ProfileState()) {
    on<UpdateProfile>(_onUpdateProfile);
    on<ChangeProfileImage>(_onChangeProfileImage);
  }

  final AppManagerCubit _appManagerCubit;

  // Form Keys
  //{
  final String kFromName = 'name';
  final String kFromPhone = 'phone';
  final String kFromEmail = 'email';
  final String kFromCountryCode = 'countryCode';
  static final initCountry = CountryParser.parsePhoneCode('966');

  // final String kFromCity = 'city';
  //}
  // profileForm
  late final profileForm = FormGroup(
    {
      kFromName: FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(3),
        ],
      ),
      kFromEmail: FormControl<String>(
        validators: [
          Validators.required,
          Validators.email,
        ],
      ),
      kFromCountryCode: FormControl<String>(validators: [Validators.required]),
      kFromPhone: FormControl<String>(
        validators: [
          Validators.required,
          // const PhoneNumberValidator(),
        ],
      ),
    },
    validators: [
      PhoneNumberValidator(kFromPhone, kFromCountryCode),
    ],
  );

  @override
  Future<void> close() {
    GetIt.I.resetLazySingleton<ProfileBloc>();
    return super.close();
  }

  FutureOr<void> _onUpdateProfile(
      UpdateProfile event, Emitter<ProfileState> emit) async {
    try {
      emit(state.copyWith(updateProfileStatus: const BlocStatus.loading()));

      if (profileForm.invalid) {
        profileForm.markAllAsTouched();
        emit(state.copyWith(
            updateProfileStatus: const BlocStatus.fail(error: "fail")));
        return;
      }
      showMessage(tr(LocaleKeys.dataHasBeenModifiedSuccessfully),
          isSuccess: true);
      GRouter.router.pop();
      // await _prefsRepository.setCustomerWithoutToken(value.data!);
      _appManagerCubit.checkUser();
      emit(state.copyWith(
        updateProfileStatus: const BlocStatus.success(),
        selectedFile: const Nullable.value(null),
      ));

      //   },
      // );
    } catch (exp) {
      emit(state.copyWith(
          updateProfileStatus: const BlocStatus.fail(error: "fail")));
    }
  }

  FutureOr<void> _onChangeProfileImage(
      ChangeProfileImage event, Emitter<ProfileState> emit) {
    emit(state.copyWith(selectedFile: Nullable.value(event.file)));
  }
}
