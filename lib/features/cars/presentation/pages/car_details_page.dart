import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/cars/presentation/widget/car_details_section.dart';
import 'package:werewolf_cars/features/cars/presentation/widget/car_detalis_appbar.dart';
import 'package:werewolf_cars/features/cars/presentation/widget/contect_button.dart';
import 'package:werewolf_cars/features/cars/presentation/widget/image_car.dart';
import 'package:werewolf_cars/features/cars/presentation/widget/more_images_cars_list.dart';
import 'package:werewolf_cars/features/cars/presentation/widget/similar_car.dart';
import 'package:werewolf_cars/features/cars/presentation/widget/user_section_with_location.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';
import 'package:werewolf_cars/generated/assets.dart';

class CarDetailsPage extends StatelessWidget {
  const CarDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CarDetalisAppbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            10.verticalSpace,
            const ImageCar(),
            10.verticalSpace,
            const MoreImagesCarsList(),
            10.verticalSpace,
            const CarDetailsSection(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    'Seller',
                    style: context.textTheme.bodyLarge!.s17.b
                        .withColor(AppColors.grey),
                  ),
                  20.verticalSpace,
                  const UserSectionWithLocation(),
                  30.verticalSpace,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContectButton(svg: Assets.svgPhone, title: 'Call'),
                      ContectButton(svg: Assets.svgNavChat, title: 'Chat'),
                      ContectButton(svg: Assets.svgEmail, title: 'Email'),
                    ],
                  ),
                  15.verticalSpace,
                  const ContectButton(
                      svg: Assets.svgEmail, title: 'Send Message to Mohammad'),
                  30.verticalSpace,
                  const WhiteDivider(color: AppColors.whiteLess, thickness: 2),
                  10.verticalSpace,
                ],
              ),
            ),
            const SimilarCar()
          ],
        ),
      ),
    );
  }
}
