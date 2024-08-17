import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/generated/assets.dart';

class FavorateIconWidget extends StatelessWidget {
  const FavorateIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HWEdgeInsets.all(14),
      child: CircleAvatar(
        backgroundColor: AppColors.blackLight.withOpacity(0.7),
        child: AppSvgPicture(
          Assets.svgHeart,
          height: 22.h,
          width: 22.w,
          color: AppColors.red,
        ),
      ),
    );
  }
}
