import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/plus_icon_widget.dart';

class CarAddImageItemEmptyOptional extends StatelessWidget {
  const CarAddImageItemEmptyOptional({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      height: 130.w,
      child: Column(
        children: [
          SizedBox(
            width: 150.w,
            height: 100.h,
            child: DottedBorder(
              color: AppColors.greyStroke, // Dotted border color
              strokeWidth: 1.5.w, // Dotted border width
              dashPattern: const [6, 3], // Length of dash and gap
              borderType: BorderType.RRect, // Rounded rectangle
              radius: Radius.circular(10.r), // Radius for the corners
              child: Container(
                width: 150.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: PlusIconWidget(),
              ),
            ),
          ),
          10.verticalSpace,
          AppText(
            'Extra Pictures Optional',
            style:
                context.textTheme.bodyMedium?.m.s14.withColor(AppColors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
