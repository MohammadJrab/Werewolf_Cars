import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/animated_dialog.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text_button.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/my_cars_list_view_builder.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/sell_dialog_body.dart';
import 'package:werewolf_cars/generated/assets.dart';
import 'package:werewolf_cars/generated/locale_keys.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SellMyCarPage extends StatelessWidget {
  const SellMyCarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        AnimatedDialog.show(context,
            barrierDismissible: true,
            barrierLabel: "ExitDialog",
            child: const SellDialogBody());
      },
      canPop: false,
      child: Scaffold(
        appBar: const CustomAppbar(
          text: 'Sell My Car',
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ProgressLine(
                value: 0.25,
              ),
              10.verticalSpace,
              const SellItemSection(),
              const NextButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadiusDirectional.circular(8)),
        height: 50.h,
        margin: HWEdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
        padding: HWEdgeInsets.symmetric(vertical: 10.h),
        alignment: Alignment.center,
        child: AppText(
          'Next',
          style:
              context.textTheme.bodyMedium?.xb.s20.withColor(AppColors.black),
        ),
      ),
    );
  }
}

class SellItemSection extends StatelessWidget {
  const SellItemSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SellCarItem(),
        SellCarItem(),
        SellCarItem(),
        SellCarItem(),
        SellCarItem(),
        SellCarItem(),
        SellCarItem(),
      ],
    );
  }
}

class SellCarItem extends StatelessWidget {
  const SellCarItem({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: HWEdgeInsets.only(top: (12.5).h, left: 10.w, right: 10.w),
        padding: HWEdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              'Make',
              style: context.textTheme.bodyMedium?.sb.s20
                  .withColor(AppColors.grey),
            ),
            10.verticalSpace,
            AppText(
              'BMW',
              style: context.textTheme.bodyMedium?.xb.s20
                  .withColor(AppColors.white),
            ),
            5.verticalSpace,
            const CustomDivider(
              thickness: .5,
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    super.key,
    required this.value,
  });
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: value.sw,
            child: const CustomDivider(color: AppColors.orange)),
        SizedBox(width: (1 - value).sw, child: const CustomDivider()),
      ],
    );
  }
}
