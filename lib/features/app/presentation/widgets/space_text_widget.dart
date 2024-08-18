import 'package:flutter/material.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';

class SpaceTextWidget extends StatelessWidget {
  const SpaceTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      ' | ',
      style: context.textTheme.bodyLarge!.s15.xb.withColor(AppColors.white),
    );
  }
}
