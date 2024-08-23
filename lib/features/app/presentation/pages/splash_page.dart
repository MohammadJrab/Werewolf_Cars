import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/features/app/domin/repositories/prefs_repository.dart';
import 'package:werewolf_cars/features/app/presentation/bloc/app_manager_cubit.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/generated/assets.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    EasyLoading.instance
      ..userInteractions = false
      ..dismissOnTap = false;
    Timer(
      const Duration(milliseconds: 1200),
      () {
        GRouter.router.goNamed(GRouter.config.mainRoutes.home);

        // GRouter.router.goNamed(GRouter.config.krpOnboardingRoutePath);

        // final isAuth = GetIt.I<PrefsRepository>().registeredCustomer;
        // final bool isPhoneVerified =
        //     GetIt.I<AppManagerCubit>().state.user?.phoneVerifiedAt != null;
        // if (isAuth && isPhoneVerified) {
        //   GRouter.router.goNamed(GRouter.config.mainRoutes.home);
        // } else {
        //   GRouter.router.goNamed(GRouter.config.krpOnboardingRoutePath);
        // }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.colorScheme.primary,
          body: Center(
            child: Image.asset(
              Assets.imagesSplash,
            ),
          )),
    );
  }
}
