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
import 'package:werewolf_cars/features/app/presentation/widgets/custom_button_with_icon.dart';
import 'package:werewolf_cars/features/auth/presentation/widgets/custom_textfeild.dart';
import 'package:werewolf_cars/generated/assets.dart';
import 'package:werewolf_cars/services/language_service.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:simple_shadow/simple_shadow.dart';
import '../../../../generated/locale_keys.g.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/phone_text_field.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({
    super.key,
  });

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
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
      value: GetIt.I<AuthBloc>(),
      child: SafeArea(
        child: Scaffold(
          body: ReactiveForm(
            formGroup: _authBloc.singUpForm,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    HWEdgeInsets.only(top: 50, right: 26, left: 26, bottom: 30),
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
                        child: AppText(LocaleKeys.auth_createAccount,
                            textAlign: TextAlign.center,
                            style: context.textTheme.headlineSmall.xb),
                      ),
                    ),
                    50.verticalSpace,
                    CustomTextField(
                      hint: LocaleKeys.enterNameHint,
                      formControlName: _authBloc.kFromName,
                      textInputAction: TextInputAction.next,
                      prefixIcon: const AppSvgPicture(
                        Assets.svgPerson,
                      ),
                    ),
                    24.verticalSpace,
                    CustomTextField(
                      hint: "Enter email",
                      formControlName: _authBloc.kFromEmail,
                      textInputAction: TextInputAction.next,
                      prefixIcon: const AppSvgPicture(
                        Assets.svgEmail,
                      ),
                    ),
                    24.verticalSpace,
                    PhoneTextField(
                      controlName: _authBloc.kFromPhone,
                      onSelect: (value) => _authBloc.singUpForm
                          .control(_authBloc.kFromCountryCode)
                          .value = value.phoneCode,
                      onInit: (value) => _authBloc.singUpForm
                          .control(_authBloc.kFromCountryCode)
                          .value = value.phoneCode,
                    ),
                    24.verticalSpace,
                    CustomTextField(
                      hint: LocaleKeys.enterPasswordHint,
                      isObscureText: true,
                      formControlName: _authBloc.kFromPassword,
                      textInputAction: TextInputAction.next,
                      prefixIcon: const AppSvgPicture(
                        Assets.svgLock,
                      ),
                    ),
                    24.verticalSpace,
                    CustomTextField(
                      hint: LocaleKeys.enterConfirmationPasswordHint,
                      isObscureText: true,
                      formControlName: _authBloc.kFromConfirmationPassword,
                      textInputAction: TextInputAction.send,
                      prefixIcon: const AppSvgPicture(
                        Assets.svgLock,
                      ),
                      onSubmitted: (control) {
                        _onSignUp();
                      },
                    ),
                    30.verticalSpace,
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
                                    context.textTheme.bodySmall!.s20.xb
                                        .withColor(AppColors.blackLight),
                                  ),
                                  backgroundColor: const WidgetStatePropertyAll(
                                      AppColors.white)),
                              text: LocaleKeys.auth_createAccount,
                              isLoading: state.registerStatus.isLoading(),
                              onPressed: _onSignUp),
                        );
                      },
                    ),
                    12.verticalSpace,
                    Row(
                      children: [
                        Container(
                          height: 2.h,
                          width: 144.w,
                          color: AppColors.grey,
                        ),
                        5.horizontalSpace,
                        AppText(
                          "OR",
                          style: context.textTheme.bodyMedium.b
                              .withColor(AppColors.grey),
                        ),
                        5.horizontalSpace,
                        Container(
                          height: 2.h,
                          width: 144.w,
                          color: AppColors.grey,
                        ),
                      ],
                    ),
                    15.verticalSpace,
                    CustomButtonWithIcon(
                      text: "Sign up with Google",
                      icon: Assets.svgGoogle,
                      onTap: () {},
                    ),
                    20.verticalSpace,
                    InkWell(
                      overlayColor:
                          const WidgetStatePropertyAll(Colors.transparent),
                      onTap: () => GRouter.router
                          .push(GRouter.config.authRoutes.loginPage),
                      child: Row(
                        textDirection: LanguageService.rtl
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            LocaleKeys.auth_youAlreadyHaveAnAccount,
                            style: context.textTheme.titleMedium!.b
                                .withColor(AppColors.whiteLess),
                          ),
                          8.horizontalSpace,
                          AppText(
                            LocaleKeys.auth_login,
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

  void _onSignUp() {
    FocusScope.of(context).unfocus();
    _authBloc.add(RegisterEvent(
      onSuccess: () async {
        final isVerified = await GoRouter.of(context)
            .push(GRouter.config.authRoutes.confirmAccountPage);
        if (isVerified == true) {
          _authBloc.loginForm
            ..control(_authBloc.kFromPhone).value =
                _authBloc.singUpForm.control(_authBloc.kFromPhone).value
            ..control(_authBloc.kFromPassword).value =
                _authBloc.singUpForm.control(_authBloc.kFromPassword).value;
          _authBloc.singUpForm.reset();
          GoRouter.of(context).push(GRouter.config.authRoutes.loginPage);
        }
      },
    ));
  }
}
