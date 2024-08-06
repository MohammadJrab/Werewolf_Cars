import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/domin/repositories/prefs_repository.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/auth/presentation/widgets/custom_textfeild.dart';
import 'package:werewolf_cars/generated/locale_keys.g.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:simple_shadow/simple_shadow.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/phone_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = true;
  late AuthBloc _authBloc;

  @override
  void initState() {
    _authBloc = GetIt.I<AuthBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _authBloc,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xfff7fafc),
          body: ReactiveForm(
            formGroup: _authBloc.loginForm,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    HWEdgeInsets.only(top: 85, right: 40, left: 40, bottom: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SimpleShadow(
                        color: AppColors.black,
                        opacity: 0.15,
                        offset: const Offset(0, 4),
                        sigma: 4,
                        child: AppText(
                          LocaleKeys.auth_login,
                          textAlign: TextAlign.center,
                          style: context.textTheme.headlineSmall.xb.withColor(
                            AppColors.blackLight.withOpacity(0.85),
                          ),
                        ),
                      ),
                    ),
                    117.verticalSpace,
                    AppText(
                      LocaleKeys.ProfileDetials_phoneNumber,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: context.textTheme.titleMedium.m.withColor(
                        AppColors.blackLight,
                      ),
                    ),
                    18.verticalSpace,
                    PhoneTextField(
                      controlName: _authBloc.kFromPhone,
                      onSelect: (value) => _authBloc.loginForm
                          .control(_authBloc.kFromCountryCode)
                          .value = value.phoneCode,
                      onInit: (value) => _authBloc.loginForm
                          .control(_authBloc.kFromCountryCode)
                          .value = value.phoneCode,
                    ),
                    23.verticalSpace,
                    AppText(
                      LocaleKeys.auth_password,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: context.textTheme.titleMedium.m.withColor(
                        AppColors.blackLight,
                      ),
                    ),
                    18.verticalSpace,
                    CustomTextField(
                      hint: LocaleKeys.enterPasswordHint,
                      isObscureText: true,
                      formControlName: _authBloc.kFromPassword,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (control) => _onLogin(),
                    ),
                    24.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => setState(() {
                            isChecked = !isChecked;
                          }),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Transform.scale(
                                origin: Offset.zero,
                                alignment: Alignment.centerLeft,
                                scaleX: 0.9,
                                scaleY: 0.8,
                                child: Checkbox(
                                  visualDensity: const VisualDensity(
                                      horizontal: -4.0, vertical: -4.0),
                                  splashRadius: 0,
                                  side: BorderSide.none,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide.none,
                                      borderRadius: BorderRadius.circular(4).r),
                                  value: isChecked,
                                  activeColor: AppColors.primary,
                                  onChanged: (newBool) => setState(() {
                                    isChecked = newBool!;
                                  }),
                                ),
                              ),
                              AppText(
                                LocaleKeys.auth_rememberMe,
                                style: context.textTheme.bodySmall!.s14.m
                                    .withColor(AppColors.blackLight),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          style: const ButtonStyle(
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.zero)),
                          onPressed: () async {
                            if (!_authBloc.loginForm
                                .control(_authBloc.kFromPhone)
                                .valid) {
                              _authBloc.loginForm
                                  .control(_authBloc.kFromPhone)
                                  .markAsTouched();
                              return;
                            }
                            final isVerified = await GoRouter.of(context).push(
                                GRouter.config.authRoutes.confirmAccountPage,
                                extra: true);

                            if (isVerified == true) {
                              if (mounted) {
                                _authBloc.resetPasswordForm
                                        .control(_authBloc.kFromPhone)
                                        .value =
                                    _authBloc.loginForm
                                        .control(_authBloc.kFromPhone)
                                        .value;
                                final isSucceededReset =
                                    await GoRouter.of(context).push(GRouter
                                        .config.authRoutes.resetPasswordPage);
                                if (isSucceededReset == true) {
                                  _authBloc.loginForm
                                          .control(_authBloc.kFromPassword)
                                          .value =
                                      _authBloc.resetPasswordForm
                                          .control(_authBloc.kFromPassword)
                                          .value;
                                }
                              }
                            }
                          },
                          child: AppText(
                            LocaleKeys.auth_forgetPassword,
                            style: context.textTheme.bodySmall!.s14.m
                                .withColor(AppColors.blackLight),
                          ),
                        ),
                      ],
                    ),
                    45.verticalSpace,
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return SizedBox(
                          width: 351.w,
                          height: 54.h,
                          child: AppElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5).r)),
                                textStyle: MaterialStatePropertyAll(
                                  context.textTheme.bodySmall!.s18.b
                                      .withColor(AppColors.white),
                                ),
                                backgroundColor: const MaterialStatePropertyAll(
                                    AppColors.primary)),
                            text: LocaleKeys.auth_login,
                            isLoading: state.loginStatus.isLoading(),
                            onPressed: _onLogin,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onLogin() {
    FocusScope.of(context).unfocus();
    _authBloc.add(LoginEvent(
      onSuccess: (user) async {
        final bool isPhoneVerified = user.customer.phoneVerifiedAt != null;
        if (isPhoneVerified) {
          GRouter.router.goNamed(GRouter.config.authRoutes.selectCountryPage);
        } else {
          // _authBloc.add(ResendCodeEvent());
          final isVerified = await GoRouter.of(context)
              .push(GRouter.config.authRoutes.confirmAccountPage);
          if (isVerified == true) {
            await GetIt.I<PrefsRepository>().setCustomer(user.copyWith(
                customer:
                    user.customer.copyWith(phoneVerifiedAt: DateTime.now())));
            GRouter.router.goNamed(GRouter.config.authRoutes.selectCountryPage);
          }
        }
      },
    ));
  }
}
