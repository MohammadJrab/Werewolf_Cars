import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';

class SectionTitleAndResetFilterWidget extends StatelessWidget {
  final String title;
  final void Function()? resetFilter;
  const SectionTitleAndResetFilterWidget(
      {super.key, required this.title, this.resetFilter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HWEdgeInsetsDirectional.only(start: 23, end: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            title,
            style:
                context.textTheme.bodyLarge?.xb.s20.withColor(AppColors.white),
          ),
          IconButton(
              onPressed: resetFilter, icon: const Icon(CupertinoIcons.restart)),
        ],
      ),
    );
  }
}
