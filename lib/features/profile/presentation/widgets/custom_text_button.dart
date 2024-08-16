import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.colorBackground,
    required this.colorFont,
    required this.text,
  });
  final Color colorBackground;
  final Color colorFont;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50.h,
        width: 120.w,
        // padding: HWEdgeInsets.symmetric(horizontal: 20, vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: colorBackground,
        ),
        child: Text(
          text,
          style: context.textTheme.bodyLarge!.s20.xb.withColor(colorFont),
        ),
      ),
    );
  }
}
