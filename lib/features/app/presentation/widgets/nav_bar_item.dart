import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_rectangle_shape.dart';

class NavBarItem extends StatelessWidget {
  final String svgAsset;
  final bool isSelected;
  final VoidCallback onTap;

  const NavBarItem({
    super.key,
    required this.svgAsset,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 65.w,
        height: 85.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AppSvgPicture(
              svgAsset,
              width: 23,
              height: 24.h,
              alignment: Alignment.center,
              color: AppColors.white,
              fit: BoxFit.cover,
            ),
            isSelected
                ? Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: CustomPaint(
                      painter: NavCustomPainter(),
                      foregroundPainter: null,
                      size: Size(75.w, 100.h),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
