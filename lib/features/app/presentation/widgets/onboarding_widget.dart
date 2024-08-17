import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:werewolf_cars/generated/assets.dart';
import 'package:werewolf_cars/generated/locale_keys.g.dart';
import '../../../../core/utils/responsive_padding.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackLight,
      body: SafeArea(child: body(context)),
    );
  }

  Widget body(BuildContext context) {
    return BlocProvider.value(
        value: GetIt.I<AuthBloc>(),
        child: Column(
          children: [
            55.verticalSpace,
            Padding(
              padding: HWEdgeInsets.symmetric(horizontal: 28),
              child: SimpleShadow(
                color: AppColors.orange,
                offset: const Offset(0, 4),
                opacity: 0.2,
                sigma: 4,
                child: AppText(
                  LocaleKeys.onboarding_welcomeToWerewolfCars,
                  style: context.textTheme.bodyLarge?.xb.s40
                      .withColor(AppColors.orange),
                ),
              ),
            ),
            80.verticalSpace,
            Image.asset(
              Assets.imagesOnboarding,
            ),
            50.verticalSpace,
            Padding(
              padding: HWEdgeInsets.symmetric(horizontal: 28),
              child: AppText(
                LocaleKeys.onboarding_buyAndSellCarsEffortlessly,
                style: context.textTheme.headlineMedium?.xb
                    .withColor(AppColors.orange),
              ),
            ),
            15.verticalSpace,
            Padding(
              padding: HWEdgeInsetsDirectional.only(start: 5),
              child: AppText(
                LocaleKeys.onboarding_YourPerfectRideisJustATapAway,
                style: context.textTheme.bodyLarge?.s20.sb,
              ),
            ),
            50.verticalSpace,
            AppElevatedButton(
              appButtonStyle: AppButtonStyle.primary,
              style: ButtonStyle(
                  backgroundColor:
                      const WidgetStatePropertyAll(AppColors.white),
                  minimumSize: WidgetStatePropertyAll(Size(319.w, 54.h))),
              onPressed: () =>
                  context.push(GRouter.config.authRoutes.signupPage),
              text: LocaleKeys.auth_createAccount,
              textStyle: context.textTheme.titleLarge.xb
                  .withColor(AppColors.blackLight),
            ),
            40.verticalSpace,
            AppElevatedButton(
              appButtonStyle: AppButtonStyle.primary,
              style: ButtonStyle(
                  backgroundColor:
                      const WidgetStatePropertyAll(AppColors.white),
                  minimumSize: WidgetStatePropertyAll(Size(319.w, 54.h))),
              onPressed: () =>
                  context.push(GRouter.config.authRoutes.loginPage),
              text: LocaleKeys.auth_login,
              textStyle: context.textTheme.titleLarge.xb
                  .withColor(AppColors.blackLight),
            ),
          ],
        ));
  }
}
