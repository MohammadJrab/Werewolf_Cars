import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';

class BudgetItem extends StatelessWidget {
  final String title;
  final String range;
  final VoidCallback onTap;

  const BudgetItem({
    super.key,
    required this.title,
    required this.range,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        padding: HWEdgeInsets.symmetric(horizontal: 20, vertical: 6),
        margin: HWEdgeInsets.only(left: 8),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyStroke, width: 1.5.r),
            borderRadius: BorderRadius.circular(8).r),
        child: Column(
          children: [
            AppText(
              title,
              style:
                  context.textTheme.titleSmall.s10.b.withColor(AppColors.grey),
            ),
            6.verticalSpace,
            AppText(range,
                style: context.textTheme.titleSmall.s10.sb
                    .withColor(AppColors.white)),
          ],
        ),
      ),
    );
  }
}
