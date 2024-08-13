import 'package:flutter/material.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';

class WhiteDivider extends StatelessWidget {
  const WhiteDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.white,
      indent: 0,
      endIndent: 0,
      thickness: 4,
    );
  }
}
