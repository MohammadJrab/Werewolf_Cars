import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/manager/search_cubit/search_cubit.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/condition_list_view_state.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/section_title_and_reset_filter_widget.dart';

class ConditionSection extends StatelessWidget {
  final SearchCubit searchCubit;

  const ConditionSection({
    super.key,
    required this.searchCubit,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleAndResetFilterWidget(
            title: 'Condition',
            resetFilter: () => searchCubit.resetConditionFilter()),
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
