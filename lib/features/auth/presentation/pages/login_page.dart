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
import 'package:werewolf_cars/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/auth/presentation/widgets/custom_textfeild.dart';
import 'package:werewolf_cars/generated/assets.dart';
import 'package:werewolf_cars/generated/locale_keys.g.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:werewolf_cars/services/language_service.dart';
import '../bloc/auth_bloc.dart';

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
                        child: AppText(LocaleKeys.auth_login,
                            textAlign: TextAlign.center,
                            style: context.textTheme.headlineSmall.xb),
                      ),
                    ),
                    120.verticalSpace,
                    CustomTextField(
                      hint: "Enter email",
                      formControlName: _authBloc.kFromEmail,
                      textInputAction: TextInputAction.next,
                      prefixIcon: const AppSvgPicture(
                        Assets.svgEmail,
                      ),
                    ),
                    30.verticalSpace,
                    CustomTextField(
                      hint: LocaleKeys.enterPasswordHint,
                      isObscureText: true,
                      formControlName: _authBloc.kFromPassword,
                      prefixIcon: const AppSvgPicture(
                        Assets.svgLock,
                      ),
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
                                  checkColor: AppColors.white,
                                  fillColor: const WidgetStatePropertyAll(
                                      AppColors.primary),
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
                              AppText(LocaleKeys.auth_rememberMe,
                                  style: context.textTheme.bodySmall!.s14.m),
                            ],
                          ),
                        ),
                        TextButton(
                          style: const ButtonStyle(
                              overlayColor:
                                  WidgetStatePropertyAll(Colors.transparent),
                              padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                          onPressed: () => GoRouter.of(context).push(
                              GRouter.config.authRoutes.resetPasswordPage),
                          child: AppText(LocaleKeys.auth_forgetPassword,
                              style: context.textTheme.bodySmall!.s14.m),
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
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5).r)),
                                textStyle: WidgetStatePropertyAll(
                                  context.textTheme.bodyMedium!.s20.b
                                      .withColor(AppColors.blackLight),
                                ),
                                backgroundColor: const WidgetStatePropertyAll(
                                    AppColors.white)),
                            text: LocaleKeys.auth_login,
                            isLoading: state.loginStatus.isLoading(),
                            onPressed: _onLogin,
                          ),
                        );
                      },
                    ),
                    85.verticalSpace,
                    InkWell(
                      overlayColor:
                          const WidgetStatePropertyAll(Colors.transparent),
                      onTap: () => GRouter.router.pushReplacement(
                          GRouter.config.authRoutes.signupPage),
                      child: Row(
                        textDirection: LanguageService.rtl
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            "Don’t have an account?",
                            style: context.textTheme.titleMedium!.b
                                .withColor(AppColors.whiteLess),
                          ),
                          8.horizontalSpace,
                          AppText(
                            "Sign Up",
                            style: context.textTheme.titleMedium!.b
                                .withColor(AppColors.orange),
                          ),
                        ],
                      ),
                    )
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
    GRouter.router.goNamed(GRouter.config.authRoutes.selectCountryPage);

    // FocusScope.of(context).unfocus();
    // _authBloc.add(LoginEvent(
    //   onSuccess: (user) async {
    //     final bool isPhoneVerified = user.customer.phoneVerifiedAt != null;
    //     if (isPhoneVerified) {
    //       GRouter.router.goNamed(GRouter.config.authRoutes.selectCountryPage);
    //     } else {
    //       // _authBloc.add(ResendCodeEvent());
    //       final isVerified = await GoRouter.of(context)
    //           .push(GRouter.config.authRoutes.confirmAccountPage);
    //       if (isVerified == true) {
    //         await GetIt.I<PrefsRepository>().setCustomer(user.copyWith(
    //             customer:
    //                 user.customer.copyWith(phoneVerifiedAt: DateTime.now())));
    //         GRouter.router.goNamed(GRouter.config.authRoutes.selectCountryPage);
    //       }
    //     }
    //   },
    // ));
  }
}
