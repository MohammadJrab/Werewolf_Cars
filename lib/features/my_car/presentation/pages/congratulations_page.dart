import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/my_car/presentation/manager/my_cars_bloc.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/circlar_check_icon.dart';

class CongratulationsPage extends StatelessWidget {
  const CongratulationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          220.verticalSpace,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CirclarCheckIcon(),
              20.verticalSpace,
              SizedBox(
                width: 260.w,
                child: AppText(
                  'Your request is submitted successfully',
                  style: context.textTheme.bodyMedium?.b.s20
                      .withColor(AppColors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              20.verticalSpace,
              SizedBox(
                width: 260.w,
                child: AppText(
                  'We will contact you after reviewing the request.',
                  style: context.textTheme.bodyMedium?.b.s14
                      .withColor(AppColors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              120.verticalSpace,
              const _Button()
            ],
          )
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: HWEdgeInsetsDirectional.only(bottom: 24, start: 30, end: 30),
        child: AppElevatedButton(
          text: 'Go to dashboard',
          onPressed: () =>
              GRouter.router.goNamed(GRouter.config.mainRoutes.myCars),
          textStyle:
              context.textTheme.bodyMedium?.xb.s20.withColor(AppColors.black),
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              minimumSize: Size(MediaQuery.of(context).size.width, 50.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8).r)),
        ));
  }
}
