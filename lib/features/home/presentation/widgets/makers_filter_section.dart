import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/makers_list_view.dart';

class MakersFilterSection extends StatelessWidget {
  const MakersFilterSection({
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
            "Browse by Makers",
            style: context.textTheme.bodyMedium.s20.sb,
          ),
        ),
        Container(
          width: 1.sw,
          height: 60.h,
          margin: HWEdgeInsetsDirectional.only(start: 14),
          child: const MakersListView(),
        ),
      ],
    );
  }
}
