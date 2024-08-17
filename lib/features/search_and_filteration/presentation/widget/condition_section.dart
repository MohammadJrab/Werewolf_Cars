import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/condition_list_view_state.dart';

class ConditionSection extends StatelessWidget {
  const ConditionSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: HWEdgeInsets.only(left: 25),
          child: AppText(
            'Condition',
            style:
                context.textTheme.bodyLarge?.xb.s21.withColor(AppColors.white),
          ),
        ),
        20.verticalSpace,
        SizedBox(
          height: 46.h,
          child: const ConditionListView(),
        ),
        30.verticalSpace,
      ],
    );
  }
}
