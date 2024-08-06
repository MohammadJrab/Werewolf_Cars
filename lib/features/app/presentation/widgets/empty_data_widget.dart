import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/generated/assets.dart';
import 'package:werewolf_cars/generated/locale_keys.g.dart';
import 'package:lottie/lottie.dart';

class EmptyDataWidget extends StatelessWidget {
  final double? imageHeight;
  final TextStyle? noItemsFoundStyle;
  final TextStyle? listCurrentlyEmptyStyle;
  const EmptyDataWidget({
    super.key,
    this.imageHeight,
    this.noItemsFoundStyle,
    this.listCurrentlyEmptyStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        50.verticalSpace,
        Padding(
          padding: HWEdgeInsets.only(right: 20),
          child: LottieBuilder.asset(
            Assets.imagesNoItemsFound,
            height: imageHeight ?? 185.h,
          ),
        ),
        AppText(
          LocaleKeys.noItemsFound,
          style: noItemsFoundStyle ??
              context.textTheme.displaySmall?.b
                  ?.withColor(AppColors.greyStroke),
        ),
        5.verticalSpace,
        AppText(
          LocaleKeys.theListIsCurrentlyEmpty,
          style: listCurrentlyEmptyStyle ??
              context.textTheme.headlineLarge.b
                  ?.withColor(AppColors.greyStroke),
        ),
      ],
    );
  }
}
