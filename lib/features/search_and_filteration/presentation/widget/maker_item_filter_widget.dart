import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';

class MakerItemFilterWidget extends StatelessWidget {
  const MakerItemFilterWidget({
    super.key,
    required this.makersLogoPath,
    this.onTap,
    this.isSelected = false,
  });
  final String makersLogoPath;
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: 80.w,
        height: 70.h,
        margin: HWEdgeInsets.only(left: 8.r),
        alignment: Alignment.center,
        padding: HWEdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8).r,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppColors.primary,
                      blurRadius: 3.r,
                    )
                  ]
                : null,
            color: AppColors.grey.shade600,
            border: isSelected
                ? Border.all(color: AppColors.primary, width: 1.5.r)
                : null),
        child: AppSvgPicture(
          makersLogoPath,
          fit: BoxFit.contain,
          width: 42.w,
        ),
      ),
    );
  }
}
