import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';

class ContectButton extends StatelessWidget {
  const ContectButton({
    super.key,
    required this.title,
    required this.svg,
  });
  final String title, svg;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            AppSvgPicture(
              svg,
              height: 17.h,
              width: 17.w,
            ),
            10.horizontalSpace,
            AppText(
              title,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge!.s17.b
                  .withColor(AppColors.blackLight),
            ),
            10.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
