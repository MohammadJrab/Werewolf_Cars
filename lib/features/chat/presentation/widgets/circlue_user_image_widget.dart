import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart' hide Image;
import 'package:fancy_shimmer_image/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:shimmer/shimmer.dart';

class CirclueUserImageWidget extends StatelessWidget {
  const CirclueUserImageWidget({
    super.key,
    this.width = 60,
    this.height = 60,
    this.userImage,
  });
  final double width;
  final double height;
  final String? userImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            offset: const Offset(04, -2),
            blurRadius: 8,
            color: AppColors.black.withOpacity(0.45),
          )
        ],
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: userImage ??
              Faker()
                  .image
                  .loremPicsum(seed: "Person", height: 200, width: 200),
          progressIndicatorBuilder: (context, url, progress) {
            return ImageShimmerWidget(
              backColor: AppColors.white,
              baseColor: AppColors.grey,
              shimmerDirection: ShimmerDirection.ltr,
              shimmerDuration: const Duration(seconds: 5),
              highlightColor: AppColors.white,
            );
          },
          errorWidget: (context, url, error) => Container(
            width: width,
            height: height,
            color: AppColors.grey,
            child: const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
