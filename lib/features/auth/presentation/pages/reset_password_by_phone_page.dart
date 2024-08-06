import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/generated/locale_keys.g.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../app/presentation/widgets/app_elvated_button.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/custom_textfeild.dart';

class ResetPasswordByPhonePage extends StatefulWidget {
  const ResetPasswordByPhonePage({super.key});

  @override
  State<ResetPasswordByPhonePage> createState() =>
      _ResetPasswordByPhonePageState();
}

class _ResetPasswordByPhonePageState extends State<ResetPasswordByPhonePage> {
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
          body: Align(
            alignment: Alignment.center,
            child: ReactiveForm(
              formGroup: _authBloc.resetPasswordForm,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          HWEdgeInsetsDirectional.only(start: 25, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppText(
                            LocaleKeys.auth_changePassword,
                            textAlign: TextAlign.center,
                            style:
                                context.textTheme.headlineSmall?.xb.withColor(
                              AppColors.blackLight.withOpacity(0.85),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            40.verticalSpace,
                            AppText(
                              LocaleKeys.auth_password,
                              style: context.textTheme.titleSmall!.xb
                                  ?.copyWith(color: AppColors.greyStroke),
                            ),
                            15.verticalSpace,
                            CustomTextField(
                              hint: LocaleKeys.auth_enterPassword,
                              formControlName: _authBloc.kFromPassword,
                              isObscureText: true,
                            ),
                            30.verticalSpace,
                            AppText(
                              LocaleKeys.auth_confirmPassword,
                              style: context.textTheme.titleSmall!.xb
                                  ?.copyWith(color: AppColors.greyStroke),
                            ),
                            15.verticalSpace,
                            CustomTextField(
                              hint: LocaleKeys.auth_confirmPassword,
                              formControlName:
                                  _authBloc.kFromConfirmationPassword,
                              isObscureText: true,
                            ),
                            const SizedBox(height: 100),
                            BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                return AppElevatedButton(
                                  text: LocaleKeys.auth_reset,
                                  isLoading:
                                      state.resetPasswordStatus.isLoading(),
                                  onPressed: state.resetPasswordStatus
                                          .isLoading()
                                      ? null
                                      : () {
                                          final isValid =
                                              _authBloc.resetPasswordForm.valid;
                                          if (!isValid) {
                                            _authBloc.resetPasswordForm
                                                .markAllAsTouched();
                                            return;
                                          }
                                          _authBloc.add(ResetPasswordEvent(
                                            onSuccess: () {
                                              Fluttertoast.showToast(
                                                  msg: LocaleKeys
                                                      .auth_thePasswordHasBeenChangedSuccessfully,
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor:
                                                      Colors.greenAccent,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                              GRouter.router.goNamed(GRouter
                                                  .config
                                                  .krpOnboardingRoutePath);
                                            },
                                          ));
                                        },
                                );
                              },
                            ),
                            50.verticalSpace
                          ],
                        ),
                      ),
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
}
