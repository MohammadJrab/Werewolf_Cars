import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/generated/assets.dart';

import '../../../home/domain/entity/car_entity.dart';
import 'space_text_widget.dart';

class BottomSectionCarMiniDetailsCard extends StatelessWidget {
  final Car car;

  const BottomSectionCarMiniDetailsCard({
    super.key, required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HWEdgeInsets.only(right: 12, left: 12, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
              '${car.year} ${car.maker} ${car.model}',//  '2021 KIA SELTOS',
                style:
                    context.textTheme.titleSmall!.xb.withColor(AppColors.white),
              ),
              10.verticalSpace,
              Row(
                children: [
                  AppText(
                   '${car.trim} ${car.engine} ${car.fuelType}',// 'GTX 1.4 GDI PETROL',
                    style: context.textTheme.titleSmall!.s13.b
                        .withColor(AppColors.white),
                  ),
                  const SpaceTextWidget(),
                  AppText(
                  car.transmission,//    'Manual',
                    style: context.textTheme.titleSmall!.s13.sb
                        .withColor(AppColors.white),
                  ),
                ],
              ),
              6.verticalSpace,
              Row(
                children: [
                  AppText(
                   '${car.mileage} KM',//    '99,488 KM',
                    style: context.textTheme.titleSmall!.s13.sb
                        .withColor(AppColors.white),
                  ),
                  const SpaceTextWidget(),

                  AppText(
                    '${car.fuelType}',
                    style: context.textTheme.titleSmall!.s13.sb
                        .withColor(AppColors.white),
                  ),
                  const SpaceTextWidget(),
                  // ToDo check
                  Padding(
                    padding: HWEdgeInsets.only(right: 4),
                    child: AppSvgPicture(
                      Assets.svgLocationPin,
                      height: 14.h,
                      width: 12.w,
                    ),
                  ),
                  AppText(
                    ' ${car.location}',
                    style: context.textTheme.titleSmall!.sb
                        .withColor(AppColors.white),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          AppText(
           car.price != null ? '${car.price}\$' : 'Soon',
            style: context.textTheme.titleMedium!.xb.withColor(AppColors.white),
          ),
        ],
      ),
    );
  }
}
