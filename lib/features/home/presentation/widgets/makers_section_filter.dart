import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/makers_list_view.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/see_full_list_button_widget.dart';

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
          padding: HWEdgeInsets.only(left: 25),
          child: AppText(
            'Make',
            style:
                context.textTheme.bodyLarge?.xb.s21.withColor(AppColors.white),
          ),
        ),
        20.verticalSpace,
        const MakersListView(),
        25.verticalSpace,
        const Align(
          alignment: Alignment.center,
          child: SeeFullListButtonWidget(),
        ),
        10.verticalSpace,
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
