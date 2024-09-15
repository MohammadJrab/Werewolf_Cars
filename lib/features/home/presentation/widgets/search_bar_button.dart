import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/generated/assets.dart';
import 'package:werewolf_cars/generated/locale_keys.g.dart';

class SearchBarButton extends StatelessWidget {
  const SearchBarButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10).r),
        padding: HWEdgeInsetsDirectional.only(start: 36, end: 24),
        margin: HWEdgeInsets.only(left: 24, right: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 24.r,
              child: const AppSvgPicture(
                Assets.svgSearch,
                color: Color(0xff8C9199),
              ),
            ),
            const Spacer(),
            AppText(
              LocaleKeys.searchHereForCars,
              style: context.textTheme.bodyMedium?.r
                  .withColor(AppColors.blackLight.withOpacity(0.67)),
            ),
            55.horizontalSpace,
            SizedBox(
              width: 24.r,
              child: const AppSvgPicture(
                Assets.svgFilter,
                color: Color(0xff8C9199),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
