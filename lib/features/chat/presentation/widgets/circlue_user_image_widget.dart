import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/generated/assets.dart';

class CirclueUserImageWidget extends StatelessWidget {
  const CirclueUserImageWidget({
    super.key,
    this.width = 60,
    this.height = 60,
  });
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            //NetworkImage
            Assets.imagesAppIcon,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: SizedBox(
        width: width.w,
        height: height.h,
      ),
    );
  }
}
