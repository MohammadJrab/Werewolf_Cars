import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/generated/assets.dart';

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
