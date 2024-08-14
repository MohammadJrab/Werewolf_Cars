import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';

class BottomSectionCarMiniDetailsCard extends StatelessWidget {
  const BottomSectionCarMiniDetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HWEdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '2021 KIA SELTOS',
                style: context.textTheme.bodyLarge!.s17.xb
                    .withColor(AppColors.white),
              ),
             10.verticalSpace,
              Row(
                children: [
                  Text(
                    'GTX 1.4 GDI PETROL',
                    style: context.textTheme.bodyLarge!.s15.xb
                        .withColor(AppColors.white),
                  ),
                  Text(
                    ' | ',
                    style: context.textTheme.bodyLarge!.s15.xb
                        .withColor(AppColors.white),
                  ),
                  Text(
                    'Manual',
                    style: context.textTheme.bodyLarge!.s15.xb
                        .withColor(AppColors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '99,488 KM',
                    style: context.textTheme.bodyLarge!.s15.xb
                        .withColor(AppColors.white),
                  ),
                  Text(
                    ' | ',
                    style: context.textTheme.bodyLarge!.s15.xb
                        .withColor(AppColors.white),
                  ),
                  Text(
                    'Petrol',
                    style: context.textTheme.bodyLarge!.s15.xb
                        .withColor(AppColors.white),
                  ),
                  Text(
                    ' | ',
                    style: context.textTheme.bodyLarge!.s15.xb
                        .withColor(AppColors.white),
                  ),
                  const Icon(
                    Icons.location_on,
                    color: AppColors.white,
                    size: 15,
                  ),
                  Text(
                    'Germany',
                    style: context.textTheme.bodyLarge!.s15.xb
                        .withColor(AppColors.white),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            r'34,999$',
            style:
                context.textTheme.bodyLarge!.s18.xb.withColor(AppColors.white),
          )
        ],
      ),
    );
  }
}
