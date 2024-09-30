import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/manager/search_cubit/search_cubit.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/budget_list_view.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/section_title_and_reset_filter_widget.dart';

class PriceSection extends StatelessWidget {
  final SearchCubit searchCubit;

  const PriceSection({
    super.key,
    required this.searchCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleAndResetFilterWidget(
            title: 'Price', resetFilter: () => searchCubit.resetPriceFilter()),
        20.verticalSpace,
        Container(
          width: 1.sw,
          height: 50.h,
          margin: HWEdgeInsetsDirectional.only(start: 14, end: 14),
          child: const BudgetListView(),
        ),
        20.verticalSpace,
        const CustomDivider(
          color: AppColors.whiteLess,
          thickness: .5,
          endIndent: 15,
          indent: 15,
        ),
        10.verticalSpace,
      ],
    );
  }
}
