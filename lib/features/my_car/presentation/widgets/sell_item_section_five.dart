import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/car_add_image_item.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/car_add_image_item_empty_optional.dart';

class SellItemSectionFive extends StatelessWidget {
  const SellItemSectionFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AppText(
          'Upload photos of your car',
          style: context.textTheme.bodyMedium?.r.s20.withColor(AppColors.grey),
        ),
        40.verticalSpace,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CarAddImageItem(
              text: 'Full Right',
            ),
            CarAddImageItem(
              text: 'Full Left',
            ),
          ],
        ),
        40.verticalSpace,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CarAddImageItem(
              text: 'Rear',
            ),
            CarAddImageItem(
              text: 'Front',
            ),
          ],
        ),
        40.verticalSpace,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CarAddImageItem(
              text: 'Dashboard from back Seat',
            ),
            CarAddImageItemEmptyOptional()
          ],
        ),
        40.verticalSpace,
      ]),
    );
  }
}
