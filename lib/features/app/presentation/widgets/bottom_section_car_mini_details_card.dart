import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/generated/assets.dart';

import 'space_text_widget.dart';

class BottomSectionCarMiniDetailsCard extends StatelessWidget {
  const BottomSectionCarMiniDetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HWEdgeInsets.only(right: 12, left: 12, top: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                '2021 KIA SELTOS',
                style: context.textTheme.bodyLarge!.s17.xb
                    .withColor(AppColors.white),
              ),
              10.verticalSpace,
              Row(
                children: [
                  AppText(
                    'GTX 1.4 GDI PETROL',
                    style: context.textTheme.bodyLarge!.s15.xb
                        .withColor(AppColors.white),
                  ),
                  const SpaceTextWidget(),
                  AppText(
                    'Manual',
                    style: context.textTheme.bodyLarge!.s13.sb
                        .withColor(AppColors.white),
                  ),
                ],
              ),
              4.verticalSpace,
              Row(
                children: [
                  AppText(
                    '99,488 KM',
                    style: context.textTheme.bodyLarge!.s13.sb
                        .withColor(AppColors.white),
                  ),
                  const SpaceTextWidget(),

                  AppText(
                    'Petrol',
                    style: context.textTheme.bodyLarge!.s13.sb
                        .withColor(AppColors.white),
                  ),
                  const SpaceTextWidget(),
                  // ToDo check
                  AppSvgPicture(
                    Assets.svgLocationPin,
                    height: 15.h,
                    width: 15.w,
                  ),
                  AppText(
                    ' Germany',
                    style: context.textTheme.bodyLarge!.s13.sb
                        .withColor(AppColors.white),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          AppText(
            r'34,999$',
            style:
                context.textTheme.bodyLarge!.s18.xb.withColor(AppColors.white),
          )
        ],
      ),
    );
  }
}
