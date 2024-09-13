import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';

class CarDetailsItem extends StatelessWidget {
  const CarDetailsItem({
    super.key,
    required this.title,
    required this.value,
  });
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Row(
            children: [
              SizedBox(
                width: 160.w,
                child: AppText(
                  '$title:',
                  style: context.textTheme.bodyLarge!.s17.r
                      .withColor(AppColors.white),
                ),
              ),
              AppText(
                value,
                style: context.textTheme.bodyLarge!.s17.r
                    .withColor(AppColors.white),
              ),
            ],
          ),
        ),
        const WhiteDivider(color: AppColors.whiteLess, thickness: 2),
      ],
    );
  }
}
