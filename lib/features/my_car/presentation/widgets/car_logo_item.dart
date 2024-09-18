import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';

class CarLogoItem extends StatelessWidget {
  const CarLogoItem({
    super.key,
    required this.assetPath,
    required this.svgColor,
    this.onTap,
  });

  final String assetPath;
  final Color? svgColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: HWEdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: AppSvgPicture(
          assetPath,
          fit: BoxFit.contain,
          color: svgColor,
        ),
      ),
    );
  }
}
