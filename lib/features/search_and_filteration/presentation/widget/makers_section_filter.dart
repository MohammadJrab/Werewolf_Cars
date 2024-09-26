import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/makers_list_view_filter.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/show_car_makers_list_view_widget.dart';

class MakersSectionFilter extends StatelessWidget {
  const MakersSectionFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: HWEdgeInsetsDirectional.only(start: 23),
          child: AppText(
            'Make',
            style:
                context.textTheme.bodyLarge?.xb.s20.withColor(AppColors.white),
          ),
        ),
        20.verticalSpace,
        SizedBox(height: 70.h, child: const MakersListViewFilter()),
        25.verticalSpace,
        const Align(
          alignment: Alignment.center,
          child: ShowCarMakersListViewWidget(),
        ),
        10.verticalSpace,
        const CustomDivider(
          color: AppColors.whiteLess,
          thickness: 0.5,
          endIndent: 15,
          indent: 15,
        ),
        8.verticalSpace,
      ],
    );
  }
}
