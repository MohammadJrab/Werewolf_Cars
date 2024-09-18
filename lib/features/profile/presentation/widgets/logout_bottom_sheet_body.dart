import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';
import 'package:werewolf_cars/features/profile/presentation/widgets/yes_no_buttons.dart';

class LogoutBottomSheetBody extends StatelessWidget {
  const LogoutBottomSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          'Logout',
          style:
              context.textTheme.bodyLarge!.s20.xb.withColor(AppColors.primary),
        ),
        10.verticalSpace,
        const CustomDivider(
          color: AppColors.whiteLess,
          endIndent: 10,
          indent: 10,
          thickness: .5,
        ),
        30.verticalSpace,
        AppText(
          'Are you sure to logout ?',
          style: context.textTheme.bodyLarge!.s20.xb.withColor(AppColors.white),
        ),
        30.verticalSpace,
        const YesNoButtons()
      ],
    );
  }
}
