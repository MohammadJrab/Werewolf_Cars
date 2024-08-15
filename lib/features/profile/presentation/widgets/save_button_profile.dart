import 'package:flutter/material.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';

class SaveButtonProfile extends StatelessWidget {
  const SaveButtonProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        width: context.mediaQuery.size.width,
        padding: HWEdgeInsets.all(20),
        margin: HWEdgeInsets.only(bottom: 50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.primary,
        ),
        child: AppText(
          "Save",
          style: context.textTheme.bodyLarge!.s17.sb.withColor(AppColors.black),
        ),
      ),
    );
  }
}
