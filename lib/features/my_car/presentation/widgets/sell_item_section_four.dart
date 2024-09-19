import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';
import 'package:werewolf_cars/generated/assets.dart';

class SellItemSectionFour extends StatelessWidget {
  const SellItemSectionFour({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: HWEdgeInsets.only(top: (12.5).h, left: 10.w, right: 10.w),
          padding: HWEdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    'Safety',
                    style: context.textTheme.bodyMedium?.r.s18
                        .withColor(AppColors.grey),
                  ),
                  AppText(
                    'Add / Edit',
                    style: context.textTheme.bodyMedium?.r.s13
                        .withColor(AppColors.grey),
                  ),
                ],
              ),
              10.verticalSpace,
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppSvgPicture(Assets.svgCheckCircle),
                            5.horizontalSpace,
                            SizedBox(
                              width: 125.w,
                              child: AppText(
                                'Adaptive cruise control',
                                style: context.textTheme.bodyMedium?.r.s15
                                    .withColor(AppColors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      30.horizontalSpace,
                      SizedBox(
                        width: 150.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppSvgPicture(Assets.svgCheckCircle),
                            5.horizontalSpace,
                            SizedBox(
                              width: 125.w,
                              child: AppText(
                                'Adaptive cruise control',
                                style: context.textTheme.bodyMedium?.r.s15
                                    .withColor(AppColors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  Row(
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppSvgPicture(Assets.svgCheckCircle),
                            5.horizontalSpace,
                            SizedBox(
                              width: 125.w,
                              child: AppText(
                                'Adaptive cruise control',
                                style: context.textTheme.bodyMedium?.r.s15
                                    .withColor(AppColors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      30.horizontalSpace,
                      SizedBox(
                        width: 150.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppSvgPicture(Assets.svgCheckCircle),
                            5.horizontalSpace,
                            SizedBox(
                              width: 125.w,
                              child: AppText(
                                'Adaptive cruise control',
                                style: context.textTheme.bodyMedium?.r.s15
                                    .withColor(AppColors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    'Exterior',
                    style: context.textTheme.bodyMedium?.r.s18
                        .withColor(AppColors.grey),
                  ),
                  GestureDetector(
                    child: AppText(
                      'Add / Edit',
                      style: context.textTheme.bodyMedium?.r.s13
                          .withColor(AppColors.grey),
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    'Interior',
                    style: context.textTheme.bodyMedium?.r.s18
                        .withColor(AppColors.grey),
                  ),
                  GestureDetector(
                    child: AppText(
                      'Add / Edit',
                      style: context.textTheme.bodyMedium?.r.s13
                          .withColor(AppColors.grey),
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              AppText(
                'Description',
                style: context.textTheme.bodyMedium?.r.s18
                    .withColor(AppColors.grey),
              ),
              20.verticalSpace,
              AppText(
                "This BMW M4 Competition features a powerful twin-turbocharged engine, a sleek carbon-fiber roof, and high-end performance features. It’s a perfect balance of luxury and speed, with low mileage and excellent condition.",
                style: context.textTheme.bodyMedium?.r.s15
                    .withColor(AppColors.white),
              ),
              30.verticalSpace,
              const CustomDivider(
                thickness: .5,
              ),
              30.verticalSpace,
              AppText(
                'Price',
                style: context.textTheme.bodyMedium?.r.s18
                    .withColor(AppColors.grey),
              ),
              8.verticalSpace,
              AppText(
                r'25,000 $',
                style: context.textTheme.bodyMedium?.b.s20
                    .withColor(AppColors.white),
              ),
              const CustomDivider(
                thickness: .5,
              ),
              70.verticalSpace,
            ],
          ),
        ),
      ],
    );
  }
}
