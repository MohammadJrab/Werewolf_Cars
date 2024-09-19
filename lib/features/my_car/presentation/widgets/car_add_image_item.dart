import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/add_car_image_item.dart';

class CarAddImageItem extends StatelessWidget {
  const CarAddImageItem({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      // height: 123.h,
      child: Column(
        children: [
          Container(
              width: 150.w,
              height: 100.h,
              decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(.2),
                  borderRadius: BorderRadius.circular(10.r)),
              child: const AddCarImageItem()),
          10.verticalSpace,
          AppText(
            text,
            style:
                context.textTheme.bodyMedium?.m.s14.withColor(AppColors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
