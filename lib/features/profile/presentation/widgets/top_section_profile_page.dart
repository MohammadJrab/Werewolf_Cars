import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/circlue_user_image_widget.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/user_name.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';

class TopSectionProfilePage extends StatelessWidget {
  const TopSectionProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        40.verticalSpace,
        const CirclueUserImageWidget(
          height: 90,
          width: 90,
        ),
        20.verticalSpace,
        const UserName(),
        10.verticalSpace,
        AppText(
          '+963 999 999 999',
          style: context.textTheme.bodyLarge!.s14.withColor(AppColors.white),
        ),
        10.verticalSpace,
        const CustomDivider(
          thickness: 1,
          endIndent: 0,
          indent: 0,
        ),
      ],
    );
  }
}
