import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
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
        child: Padding(
          padding: HWEdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              80.verticalSpace,
              AppText(
                LocaleKeys.onboarding_welcomeToWerewolfCars,
                style: context.textTheme.bodyLarge?.xb.s40
                    .withColor(AppColors.orange),
              ),
              120.verticalSpace,
              Image.asset(
                Assets.imagesOnboarding,
              ),
              80.verticalSpace,
              AppText(
                LocaleKeys.onboarding_buyAndSellCarsEffortlessly,
                style: context.textTheme.headlineMedium?.xb,
              ),
              10.verticalSpace,
              AppText(
                LocaleKeys.onboarding_YourPerfectRideisJustATapAway,
                style: context.textTheme.bodyLarge?.s20.sb,
              ),
              100.verticalSpace,
              AppElevatedButton(
                appButtonStyle: AppButtonStyle.primary,
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(AppColors.white)),
                onPressed: () =>
                    context.goNamed(GRouter.config.mainRoutes.home),
                text: LocaleKeys.letsgo,
                textStyle: context.textTheme.titleLarge.xb
                    .withColor(AppColors.blackLight),
              ),
            ],
          ),
        ));
  }
}
