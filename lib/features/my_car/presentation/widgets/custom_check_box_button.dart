import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/generated/assets.dart';

class CustomCheckBoxButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Widget? leading;
  final VoidCallback? onTap;

  const CustomCheckBoxButton({
    super.key,
    this.onTap,
    this.isSelected = false,
    required this.title,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 288.w,
        padding: HWEdgeInsets.all(6),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.grey,
              width: 1.r,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leading != null) ...[leading!, 12.horizontalSpace],
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 0, maxWidth: 200.w),
              child: AppText(
                title,
                style: context.textTheme.bodyMedium?.s20.r,
              ),
            ),
            const Spacer(),
            Container(
              width: 20.w,
              height: 20.h,
              padding: HWEdgeInsets.all(1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.grey,
                    width: isSelected ? 3.r : 2.5.r),
              ),
              child: isSelected
                  ? const AppSvgPicture(Assets.svgCheck,
                      color: AppColors.primary)
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
