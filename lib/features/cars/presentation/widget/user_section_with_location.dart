import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/circlue_user_image_widget.dart';
import 'package:werewolf_cars/generated/assets.dart';

class UserSectionWithLocation extends StatelessWidget {
  const UserSectionWithLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CirclueUserImageWidget(
          height: 80,
          width: 80,
        ),
        25.horizontalSpace,
        Column(
          children: [
            AppText(
              'Name User',
              style: context.textTheme.bodyLarge!.s17.xb
                  .withColor(AppColors.white),
            ),
            7.verticalSpace,
            Row(
              children: [
                5.horizontalSpace,
                AppSvgPicture(
                  Assets.svgLocationPin,
                  height: 15.h,
                  width: 15.w,
                  color: AppColors.grey,
                ),
                4.horizontalSpace,
                AppText(
                  'Location',
                  style: context.textTheme.bodyLarge!.s17.r
                      .withColor(AppColors.grey),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
