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
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/auth/presentation/widgets/custom_textfeild.dart';
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
          backgroundColor: const Color(0xfff7fafc),
          body: ReactiveForm(
            formGroup: _authBloc.singUpForm,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    HWEdgeInsets.only(top: 65, right: 40, left: 40, bottom: 30),
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
                          LocaleKeys.auth_createAccount,
                          textAlign: TextAlign.center,
                          style: context.textTheme.headlineSmall.xb.withColor(
                            AppColors.blackLight.withOpacity(0.85),
                          ),
                        ),
                      ),
                    ),
                    50.verticalSpace,
                    AppText(
                      LocaleKeys.ProfileDetials_fullName,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: context.textTheme.titleMedium.m.withColor(
                        AppColors.blackLight,
                      ),
                    ),
                    18.verticalSpace,
                    CustomTextField(
                      hint: LocaleKeys.enterNameHint,
                      formControlName: _authBloc.kFromName,
                      textInputAction: TextInputAction.next,
                    ),
                    23.verticalSpace,
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
                      onSelect: (value) => _authBloc.singUpForm
                          .control(_authBloc.kFromCountryCode)
                          .value = value.phoneCode,
                      onInit: (value) => _authBloc.singUpForm
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
                      textInputAction: TextInputAction.next,
                    ),
                    23.verticalSpace,
                    AppText(
                      LocaleKeys.auth_confirmPassword,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: context.textTheme.titleMedium.m.withColor(
                        AppColors.blackLight,
                      ),
                    ),
                    18.verticalSpace,
                    CustomTextField(
                      hint: LocaleKeys.enterConfirmationPasswordHint,
                      isObscureText: true,
                      formControlName: _authBloc.kFromConfirmationPassword,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (control) {
                        _onSignUp();
                      },
                    ),
                    24.verticalSpace,
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     InkWell(
                    //       hoverColor: Colors.transparent,
                    //       splashColor: Colors.transparent,
                    //       highlightColor: Colors.transparent,
                    //       onTap: () => setState(() {
                    //         isChecked = !isChecked;
                    //       }),
                    //       child: Row(
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         children: [
                    //           Transform.scale(
                    //             origin: Offset.zero,
                    //             alignment: Alignment.centerLeft,
                    //             scaleX: 0.9,
                    //             scaleY: 0.8,
                    //             child: Checkbox(
                    //               visualDensity: const VisualDensity(horizontal: -4.0, vertical: -4.0),
                    //               splashRadius: 0,
                    //               side: BorderSide.none,
                    //               shape: RoundedRectangleBorder(
                    //                   side: BorderSide.none, borderRadius: BorderRadius.circular(4).r),
                    //               value: isChecked,
                    //               activeColor: AppColors.primary,
                    //               onChanged: (newBool) => setState(() {
                    //                 isChecked = newBool!;
                    //               }),
                    //             ),
                    //           ),
                    //           AppText(
                    //             LocaleKeys.auth_rememberMe,
                    //             style: context.textTheme.bodySmall!.s14.m.withColor(AppColors.blackLight),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
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
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          AppColors.primary)),
                              text: LocaleKeys.auth_createAccount,
                              isLoading: state.registerStatus.isLoading(),
                              onPressed: _onSignUp),
                        );
                      },
                    ),
                    45.verticalSpace,
                    InkWell(
                      overlayColor:
                          const MaterialStatePropertyAll(Colors.transparent),
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
                                .withColor(AppColors.blackLight),
                          ),
                          5.horizontalSpace,
                          AppText(
                            LocaleKeys.auth_login,
                            style: context.textTheme.titleMedium!.m
                                .withColor(AppColors.blackLight),
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
