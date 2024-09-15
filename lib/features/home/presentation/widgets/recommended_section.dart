import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/cars_list_view_builder.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: HWEdgeInsetsDirectional.only(start: 24, top: 20, bottom: 20),
          child: AppText(
            "Recommended",
            style: context.textTheme.bodyMedium.s20.sb,
          ),
        ),
        Container(
          height: 215.h,
          margin: HWEdgeInsetsDirectional.only(start: 8, end: 14),
          width: double.infinity,
          child: CarsListViewBuilder(
            scrollDirection: Axis.horizontal,
            padding: HWEdgeInsetsDirectional.only(start: 14),
          ),
        ),
      ],
    );
  }
}
