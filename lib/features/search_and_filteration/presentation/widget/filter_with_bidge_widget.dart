import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/generated/assets.dart';
import 'package:badges/badges.dart' as badges;

class FilterWithBidgeWidget extends StatelessWidget {
  final int filteredItemCount;

  const FilterWithBidgeWidget({super.key, this.filteredItemCount = 4});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GRouter.router.pushNamed(GRouter.config.filterRoutes.filter);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        alignment: Alignment.center,
        width: 65.w,
        padding: HWEdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          // color: AppColors.grey.shade900,
          border: filteredItemCount > 0
              ? Border.all(color: AppColors.primary, width: 1.6.r)
              : null,
        ),
        child: badges.Badge(
          position: badges.BadgePosition.bottomEnd(end: -8),
          showBadge: true,
          onTap: () {},
          badgeContent: Center(
            child: AppText(
              filteredItemCount.toString(),
              style: context.textTheme.bodySmall!.sb!.copyWith(
                color: AppColors.white,
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          badgeAnimation: const badges.BadgeAnimation.slide(),
          badgeStyle: badges.BadgeStyle(
            shape: badges.BadgeShape.circle,
            badgeColor: AppColors.blackLight,
            padding: HWEdgeInsets.all(5),
          ),
          child: AppSvgPicture(Assets.svgFilterAcitve, width: 25.r),
        ),
      ),
    );
  }
}
