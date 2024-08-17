import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/cylinders_and_doors_list_view_state.dart';

class CylindersAndDoorsSection extends StatelessWidget {
  const CylindersAndDoorsSection({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: HWEdgeInsets.only(left: 25),
          child: AppText(
            title,
            style:
                context.textTheme.bodyLarge?.xb.s21.withColor(AppColors.white),
          ),
        ),
        20.verticalSpace,
        SizedBox(
          height: 46.h,
          child: const CylindersAndDoorsListView(),
        ),
        30.verticalSpace,
      ],
    );
  }
}
