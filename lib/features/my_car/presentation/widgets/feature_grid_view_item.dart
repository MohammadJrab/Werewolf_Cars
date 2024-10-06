import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/generated/assets.dart';

class FeatureGridViewItem extends StatelessWidget {
  final String name;
  const FeatureGridViewItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSvgPicture(Assets.svgCheckCircle),
        5.horizontalSpace,
        SizedBox(
          width: 130.w,
          child: AppText(
            name,
            maxLines: 2,
            isAutoScale: true,
            style:
                context.textTheme.bodySmall?.s15.r.withColor(AppColors.white),
          ),
        ),
      ],
    );
  }
}
