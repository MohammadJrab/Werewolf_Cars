import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';

class CarTypeItem extends StatelessWidget {
  final bool isSelected;
  final String svg;
  final String name;

  const CarTypeItem({
    super.key,
    required this.isSelected,
    required this.svg,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100.w,
      margin: HWEdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.grey.shade900,
      ),
      child: SizedBox(
        height: 50.h,
        child: Stack(
          children: [
            Positioned(
              top: -8.h,
              left: 0,
              right: 0,
              child: Center(
                child: AppSvgPicture(
                  svg,
                  height: 55.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 4.h,
              left: 0,
              right: 0,
              child: Center(
                child: AppText(
                  name,
                  style: context.textTheme.bodySmall.s10.sb,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
