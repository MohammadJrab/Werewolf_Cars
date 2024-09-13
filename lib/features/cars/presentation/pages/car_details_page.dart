import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/features/cars/presentation/widget/car_details_section.dart';
import 'package:werewolf_cars/features/cars/presentation/widget/car_detalis_appbar.dart';
import 'package:werewolf_cars/features/cars/presentation/widget/image_car.dart';
import 'package:werewolf_cars/features/cars/presentation/widget/more_images_cars_list.dart';
import 'package:werewolf_cars/features/cars/presentation/widget/seller_sction_detalis.dart';
import 'package:werewolf_cars/features/cars/presentation/widget/similar_car.dart';

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
            const SellerSctionDetalis(),
            const SimilarCar()
          ],
        ),
      ),
    );
  }
}
