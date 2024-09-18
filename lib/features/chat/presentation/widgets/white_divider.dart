import 'package:flutter/material.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.thickness = 4,
    this.indent = 0,
    this.endIndent = 0,
    this.color = AppColors.whiteLess,
  });
  final double thickness;
  final double indent;
  final double endIndent;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      indent: indent,
      endIndent: endIndent,
      thickness: thickness,
    );
  }
}
