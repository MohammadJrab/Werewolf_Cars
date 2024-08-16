import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';

class CarTypeItem extends StatelessWidget {
  final bool isSelected;
  final String svg;

  const CarTypeItem({
    super.key,
    required this.isSelected,
    required this.svg,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      alignment: Alignment.center,
      width: 80.w,
      margin: HWEdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.grey,
        border:
            isSelected ? Border.all(color: AppColors.primary, width: 2) : null,
      ),
      child: AppSvgPicture(svg),
    );
  }
}
