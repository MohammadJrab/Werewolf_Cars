import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/generated/assets.dart';

class AddCarImageItem extends StatelessWidget {
  const AddCarImageItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: AppColors.orange,
            radius: 10.r,
            child: const AppSvgPicture(Assets.svgPlusAdd),
          ),
        )
      ],
    );
  }
}
