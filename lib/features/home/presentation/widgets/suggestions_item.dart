import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';

class SuggestionsItem extends StatelessWidget {
  const SuggestionsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: HWEdgeInsets.all(4),
      margin: HWEdgeInsets.only(left: 20),
      height: 66.h,
      width: 110.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText(
            'Less than',
            style: context.textTheme.bodyLarge?.s14.withColor(AppColors.grey),
          ),
          AppText(
            r'10,000 $',
            style: context.textTheme.bodyLarge?.s14.withColor(AppColors.white),
          ),
        ],
      ),
    );
  }
}
