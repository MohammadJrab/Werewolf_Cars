import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/filter_item.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/filter_with_bidge_widget.dart';

class SearchFiltersSection extends StatelessWidget {
  const SearchFiltersSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.h,
      margin: HWEdgeInsets.only(left: 23),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const FilterWithBidgeWidget(filteredItemCount: 3),
          10.horizontalSpace,
          const FilterItem(title: "Make"),
          10.horizontalSpace,
          const FilterItem(title: "Price"),
          10.horizontalSpace,
          const FilterItem(title: "Year"),
          10.horizontalSpace,
          const FilterItem(title: "Mileage"),
          10.horizontalSpace,
          TextButton(
            onPressed: () {},
            child: AppText(
              "Reset",
              style: context.textTheme.titleMedium?.s13.m
                  .withColor(AppColors.primary),
            ),
          ),
          14.horizontalSpace,
        ],
      ),
    );
  }
}
