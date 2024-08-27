import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/common/constants/constants.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/circlue_user_image_widget.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/car_mini_details_card_widget.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';
import 'package:werewolf_cars/generated/assets.dart';

class CarDetailsPage extends StatelessWidget {
  const CarDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        text: 'Car Details',
        automaticallyImplyLeading: true,
        action: Padding(
          padding: const EdgeInsets.only(right: 20),
          // ToDo :  Heart must be empty not solid
          child: AppSvgPicture(
            Assets.svgHeart,
            height: 24.h,
            width: 24.w,
          ),
        ),
      ),
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

class ContectButton extends StatelessWidget {
  const ContectButton({
    super.key,
    required this.title,
    required this.svg,
  });
  final String title, svg;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            AppSvgPicture(
              svg,
              height: 17.h,
              width: 17.w,
            ),
            10.horizontalSpace,
            AppText(
              title,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge!.s17.b
                  .withColor(AppColors.blackLight),
            ),
            10.horizontalSpace,
          ],
        ),
      ),
    );
  }
}

class UserSectionWithLocation extends StatelessWidget {
  const UserSectionWithLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CirclueUserImageWidget(
          height: 80,
          width: 80,
        ),
        25.horizontalSpace,
        Column(
          children: [
            AppText(
              'Name User',
              style: context.textTheme.bodyLarge!.s17.xb
                  .withColor(AppColors.white),
            ),
            7.verticalSpace,
            Row(
              children: [
                5.horizontalSpace,
                AppSvgPicture(
                  Assets.svgLocationPin,
                  height: 15.h,
                  width: 15.w,
                  color: AppColors.grey,
                ),
                4.horizontalSpace,
                AppText(
                  'Location',
                  style: context.textTheme.bodyLarge!.s17.r
                      .withColor(AppColors.grey),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

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

class CarDetailsSection extends StatelessWidget {
  const CarDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const CarNameAndPriceRowWidget(),
          const WhiteDivider(color: AppColors.whiteLess, thickness: 2),
          20.verticalSpace,
          const GridDetailesGridView(),
          const WhiteDivider(color: AppColors.whiteLess, thickness: 2),
          const CarDetailsItem(title: 'Brand', value: 'Ferrari'),
          const CarDetailsItem(title: 'Model', value: 'Ferrari'),
          const CarDetailsItem(title: 'Year Model', value: 'Ferrari'),
          const CarDetailsItem(title: 'Trim', value: 'Ferrari'),
          const CarDetailsItem(title: 'Paint Parts', value: 'Ferrari'),
          const CarDetailsItem(title: 'Seat Number', value: 'Ferrari'),
          const CarDetailsItem(title: 'Plate', value: 'Ferrari'),
          const CarDetailsItem(title: 'Color', value: 'Ferrari'),
          const CarDetailsItem(title: 'Seat Material', value: 'Ferrari'),
          const CarDetailsItem(title: 'Condition', value: 'Ferrari'),
          const CarDetailsItem(title: 'Wheels', value: 'Ferrari'),
          const CarDetailsItem(title: 'Vehicle Type', value: 'Ferrari'),
          const CarDetailsItem(title: 'Gearbox', value: 'Ferrari'),
          const CarDetailsItem(title: 'Cylinders', value: 'Ferrari'),
          const CarDetailsItem(title: 'Interior Color', value: 'Ferrari'),
          const CarDetailsItem(title: 'Exterior Color', value: 'Ferrari'),
          const CarDetailsItem(title: 'Location', value: 'Ferrari'),
          10.verticalSpace,
        ],
      ),
    );
  }
}

class CarDetailsItem extends StatelessWidget {
  const CarDetailsItem({
    super.key,
    required this.title,
    required this.value,
  });
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Row(
            children: [
              SizedBox(
                width: 160.w,
                child: AppText(
                  '$title:',
                  style: context.textTheme.bodyLarge!.s17.r
                      .withColor(AppColors.white),
                ),
              ),
              AppText(
                value,
                style: context.textTheme.bodyLarge!.s17.r
                    .withColor(AppColors.white),
              ),
            ],
          ),
        ),
        const WhiteDivider(color: AppColors.whiteLess, thickness: 2),
      ],
    );
  }
}

class GridDetailesGridView extends StatelessWidget {
  const GridDetailesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      child: GridView.builder(
        addAutomaticKeepAlives: false,
        shrinkWrap: true,
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 40,
            mainAxisSpacing: 0,
            childAspectRatio: 1),
        itemBuilder: (context, index) => GridDetailesGridItem(
          path: carDetailsGridItems[index],
          title: 'title',
        ),
      ),
    );
  }
}

class GridDetailesGridItem extends StatelessWidget {
  const GridDetailesGridItem({
    super.key,
    required this.title,
    required this.path,
  });
  final String title, path;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSvgPicture(
          path,
          height: 30.h,
          width: 30.w,
        ),
        7.verticalSpace,
        AppText(
          title,
          style: context.textTheme.bodyLarge!.s13.r.withColor(AppColors.white),
        ),
      ],
    );
  }
}

class CarNameAndPriceRowWidget extends StatelessWidget {
  const CarNameAndPriceRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          'Ferrari',
          style: context.textTheme.bodyLarge!.s18.xb.withColor(AppColors.white),
        ),
        5.horizontalSpace,
        AppText(
          'SF90 Stradale',
          style: context.textTheme.bodyLarge!.s18.withColor(AppColors.white),
        ),
        const Spacer(),
        AppSvgPicture(
          Assets.svgBell,
          height: 24.h,
          width: 24.w,
        ),
        8.horizontalSpace,
        AppText(
          r'125,000 $',
          style:
              context.textTheme.bodyLarge!.s18.xb.withColor(AppColors.primary),
        ),
      ],
    );
  }
}

class ImageCar extends StatelessWidget {
  const ImageCar({
    super.key,
    this.width = 354,
    this.height = 176,
  });
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10).r),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10).r,
        child: Image.asset(
          Assets.imagesCar2,
          width: width.w,
          height: height.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MoreImagesCarsList extends StatelessWidget {
  const MoreImagesCarsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 101.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 4,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: HWEdgeInsets.only(left: 11),
          child: const ImageCar(
            width: 101,
            height: 101,
          ),
        ),
      ),
    );
  }
}
