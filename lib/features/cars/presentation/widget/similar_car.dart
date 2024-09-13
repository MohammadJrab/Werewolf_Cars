import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/car_mini_details_card_widget.dart';

class SimilarCar extends StatelessWidget {
  const SimilarCar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          'Similar',
          style: context.textTheme.bodyLarge!.s17.b.withColor(AppColors.grey),
        ),
        15.verticalSpace,
        const CarMiniDetailsCardWidget(),
        10.verticalSpace,
      ],
    );
  }
}
