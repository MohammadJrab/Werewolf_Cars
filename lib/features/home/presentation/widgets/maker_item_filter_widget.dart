import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';

class MakerItemFilterWidget extends StatelessWidget {
  const MakerItemFilterWidget({
    super.key,
    required this.makersLogoPath,
    required this.isSelected,
    this.onTap,
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
        height: 80.h,
        margin: HWEdgeInsets.only(left: 20.r),
        alignment: Alignment.center,
        padding: HWEdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const RadialGradient(
            colors: [
              AppColors.grey,
              AppColors.greyStroke,
            ],
          ),
          border: isSelected
              ? Border.all(
                  color: AppColors.white,
                  width: 2,
                )
              : null,
        ),
        child: AppSvgPicture(makersLogoPath),
      ),
    );
  }
}
