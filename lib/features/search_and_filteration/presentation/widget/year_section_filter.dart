import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/year_item_widget_state.dart';

class YearSectionFilter extends StatelessWidget {
  const YearSectionFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: HWEdgeInsets.only(left: 25),
          child: AppText(
            'Year',
            style:
                context.textTheme.bodyLarge?.xb.s21.withColor(AppColors.white),
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
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              YearItemWidget(),
              YearItemWidget(),
            ],
          ),
        ),
        20.verticalSpace,
        const WhiteDivider(
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
