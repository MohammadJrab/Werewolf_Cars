import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/custom_slider_widget_state.dart';

import 'suggestions_list_view_item.dart';

class PriceSection extends StatelessWidget {
  const PriceSection({
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
            'Price',
            style:
                context.textTheme.bodyLarge?.xb.s21.withColor(AppColors.white),
          ),
        ),
        20.verticalSpace,
        Padding(
          padding: HWEdgeInsets.symmetric(horizontal: 20),
          // TODO we must change this slider
          child: const CustomSliderWidget(),
        ),
        20.verticalSpace,
        Padding(
          padding: HWEdgeInsets.only(left: 25),
          child: AppText(
            'Suggestions',
            style: context.textTheme.bodyLarge?.s15.withColor(AppColors.white),
          ),
        ),
        20.verticalSpace,
        SizedBox(
          height: 66.h,
          child: const SuggestionsListViewItem(),
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
