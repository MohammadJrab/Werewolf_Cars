import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/generated/assets.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: HWEdgeInsets.only(
        left: 4,
        right: 4,
        bottom: 8,
        top: 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          10.horizontalSpace,
          Text(
            'send',
            style:
                context.textTheme.bodyMedium!.s15.xb.withColor(AppColors.white),
            // style: TextStyle(color: AppColors.white, fontSize: 16),
          ),
          4.horizontalSpace,
          const AppSvgPicture(Assets.svgSend),
          2.horizontalSpace,
        ],
      ),
    );
  }
}
