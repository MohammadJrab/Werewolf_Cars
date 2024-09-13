import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/cars/presentation/widget/image_car.dart';

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
