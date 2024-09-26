import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/animated_dialog.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/year_picker_dialog.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/manager/search_cubit/search_cubit.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/year_item_widget_state.dart';

class YearSectionFilter extends StatelessWidget {
  const YearSectionFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: HWEdgeInsets.only(left: 25),
          child: AppText(
            'Year',
            style:
                context.textTheme.bodyLarge?.xb.s20.withColor(AppColors.white),
          ),
        ),
        20.verticalSpace,
        Padding(
          padding: HWEdgeInsets.symmetric(horizontal: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                'Min year',
                style:
                    context.textTheme.bodyLarge?.s14.withColor(AppColors.white),
              ),
              AppText(
                'Max year',
                style:
                    context.textTheme.bodyLarge?.s14.withColor(AppColors.white),
              ),
            ],
          ),
        ),
        15.verticalSpace,
        Padding(
          padding: HWEdgeInsets.symmetric(horizontal: 25),
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  YearItemWidget(
                    key: const Key("MinYear"),
                    selectedYear: state.selectedCarMinYear,
                    onTap: () => AnimatedDialog.show(context,
                        insetPadding: HWEdgeInsets.only(
                            top: 60, left: 40, right: 40, bottom: 30),
                        child: YearPickerDialog(
                          currentYear: state.selectedCarMinYear,
                          onYearChanged: (minYear) =>
                              searchCubit.changeCarYearFilter(minYear: minYear),
                        ),
                        barrierDismissible: true,
                        barrierLabel: "YearPickerDialog"),
                  ),
                  Container(
                    width: 30.w,
                    height: 0.5.h,
                    decoration: const BoxDecoration(color: AppColors.whiteLess),
                  ),
                  YearItemWidget(
                    key: const Key("MaxYear"),
                    selectedYear: state.selectedCarMaxYear,
                    onTap: () => AnimatedDialog.show(context,
                        insetPadding: HWEdgeInsets.only(
                            top: 60, left: 40, right: 40, bottom: 30),
                        child: YearPickerDialog(
                          currentYear: state.selectedCarMaxYear,
                          onYearChanged: (maxYear) {
                            if (state.selectedCarMinYear != null
                                ? maxYear < state.selectedCarMinYear!
                                : false) {
                              searchCubit.changeCarYearFilter(maxYear: maxYear);
                            }
                          },
                        ),
                        barrierDismissible: true,
                        barrierLabel: "YearPickerDialog"),
                  ),
                ],
              );
            },
          ),
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
