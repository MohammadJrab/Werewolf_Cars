import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/generated/assets.dart';

class ChatBubbleItemWidget extends StatelessWidget {
  const ChatBubbleItemWidget({
    super.key,
    required this.isCurrent,
  });

  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          isCurrent ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment:
          isCurrent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: HWEdgeInsets.only(top: 20, bottom: 20, right: 12, left: 20),
          width: context.mediaQuery.size.width * 0.6,
          decoration: BoxDecoration(
              color: isCurrent ? AppColors.primary : AppColors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft:
                      isCurrent ? Radius.circular(20.r) : Radius.circular(0.r),
                  bottomRight:
                      isCurrent ? Radius.circular(0.r) : Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                  topLeft: Radius.circular(20.r))),
          child: AppText(
            'Message body Message body Message body Message Message body Message body Message body Message ',
            style: context.textTheme.bodyLarge!.s15
                .withColor(isCurrent ? AppColors.white : AppColors.black),
          ),
        ),
        4.verticalSpace,
        Row(
          mainAxisAlignment:
              isCurrent ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment:
              isCurrent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            const AppText(
              '12:00 am',
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
            10.horizontalSpace,
            isCurrent
                ? CircleAvatar(
                    backgroundColor: AppColors.primary,
                    radius: 12.r,
                    child: AppSvgPicture(
                      Assets.svgCheck,
                      height: 15.h,
                      width: 15.w,
                    ),
                  )
                : const SizedBox(),
            4.horizontalSpace,
          ],
        )
      ],
    );
  }
}
