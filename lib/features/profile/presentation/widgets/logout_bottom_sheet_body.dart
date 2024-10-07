import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';
import 'package:werewolf_cars/generated/locale_keys.g.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppElevatedButton(
              text: LocaleKeys.cancel,
              onPressed: () => context.pop(),
              textStyle: context.textTheme.labelMedium.s18.b
                  .withColor(AppColors.blackLight),
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  minimumSize: Size(120.w, 53.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10).r)),
            ),
            10.horizontalSpace,
            AppElevatedButton(
              text: LocaleKeys.yesAmSure,
              onPressed: () =>
                  GetIt.I<AuthBloc>().add(LogoutEvent(onSuccess: () async {})),
              textStyle: context.textTheme.labelMedium.s18.b
                  .withColor(AppColors.white),
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: Size(140.w, 53.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10).r)),
            ),
          ],
        )
      ],
    );
  }
}
