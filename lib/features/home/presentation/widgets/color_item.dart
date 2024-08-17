import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.colorName,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  final String colorName;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: HWEdgeInsets.only(left: 20),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              decoration: BoxDecoration(
                border: isSelected
                    ? Border.all(color: Colors.white, width: 2)
                    : null,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: color,
                radius: isSelected ? 23.5.r : 25.r,
              ),
            ),
            10.verticalSpace,
            AppText(
              colorName,
              style:
                  context.textTheme.bodyLarge?.s14.withColor(AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
