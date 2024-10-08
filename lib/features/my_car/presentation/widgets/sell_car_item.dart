import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';

class SellCarItem extends StatelessWidget {
  
  const SellCarItem({
    super.key,
    this.onTap,
    required this.title,
    required this.value,
  });
  final void Function()? onTap;
  final String title, value;

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
              title,
              style:
                  context.textTheme.bodyMedium?.r.s18.withColor(AppColors.grey),
            ),
            10.verticalSpace,
            AppText(
              value,
              style: context.textTheme.bodyMedium?.b.s20
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
