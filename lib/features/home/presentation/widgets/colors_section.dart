import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/colors_list_view_state.dart';

class ColorsSection extends StatelessWidget {
  const ColorsSection({
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
            "Colors",
            style:
                context.textTheme.bodyLarge?.xb.s21.withColor(AppColors.white),
          ),
        ),
        20.verticalSpace,
        SizedBox(
          height: 82.h,
          child: const ColorsListView(),
        ),
        30.verticalSpace,
      ],
    );
  }
}
