import 'package:faker/faker.dart' hide Image;
import 'package:fancy_shimmer_image/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

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
      width: width.w,
      height: height.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: Image.network(
          fit: BoxFit.contain,
          Faker().image.loremPicsum(seed: "Person", height: 200, width: 200),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress != null) {
              return ImageShimmerWidget(
                backColor: AppColors.white,
                baseColor: AppColors.grey,
                shimmerDirection: ShimmerDirection.ltr,
                shimmerDuration: const Duration(seconds: 5),
                highlightColor: AppColors.white,
              );
            } else {
              return child;
            }
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: width,
              height: height,
              color: AppColors.grey,
              child: const Icon(Icons.error),
            );
          },
        ),
      ),
    );
  }
}
