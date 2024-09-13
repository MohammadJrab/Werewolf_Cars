import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/generated/assets.dart';

class CarNameAndPriceRowWidget extends StatelessWidget {
  const CarNameAndPriceRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          'Ferrari',
          style: context.textTheme.bodyLarge!.s18.xb.withColor(AppColors.white),
        ),
        5.horizontalSpace,
        AppText(
          'SF90 Stradale',
          style: context.textTheme.bodyLarge!.s18.withColor(AppColors.white),
        ),
        const Spacer(),
        AppSvgPicture(
          Assets.svgBell,
          height: 24.h,
          width: 24.w,
        ),
        8.horizontalSpace,
        AppText(
          r'125,000 $',
          style:
              context.textTheme.bodyLarge!.s18.xb.withColor(AppColors.primary),
        ),
      ],
    );
  }
}
