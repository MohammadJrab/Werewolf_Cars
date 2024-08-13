import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';

class DateTimeWidgetMessageItem extends StatelessWidget {
  const DateTimeWidgetMessageItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 144.w,
      padding: HWEdgeInsets.symmetric(vertical: 10, horizontal: 8),
      margin: HWEdgeInsets.only(bottom: 24),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: AppColors.white,
      ),
      child: const Text(
        '8 jun 2024',
        maxLines: 1,
        style: TextStyle(
          color: AppColors.black,
        ),
      ),
    );
  }
}
