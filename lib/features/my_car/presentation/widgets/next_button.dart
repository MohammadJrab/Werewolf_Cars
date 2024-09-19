import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    this.onTap, required this.text,
  });
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadiusDirectional.circular(8.r)),
        height: 50.h,
        margin: HWEdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
        padding: HWEdgeInsets.symmetric(vertical: 10.h),
        alignment: Alignment.center,
        child: AppText(
       text,
          style:
              context.textTheme.bodyMedium?.xb.s20.withColor(AppColors.black),
        ),
      ),
    );
  }
}
