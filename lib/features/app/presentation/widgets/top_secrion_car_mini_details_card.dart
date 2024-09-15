import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/favorate_icon_widget.dart';
import 'package:werewolf_cars/generated/assets.dart';

class TopSecrionCarMiniDetailsCard extends StatelessWidget {
  const TopSecrionCarMiniDetailsCard({
    super.key,
    required this.isFaviorateIcon,
  });

  final bool isFaviorateIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      alignment: Alignment.topRight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
          border:
              Border(bottom: BorderSide(color: AppColors.white, width: 1.w)),
          image: const DecorationImage(
            image: AssetImage(Assets.imagesCar2),
            fit: BoxFit.cover,
          )),
      child: isFaviorateIcon ? const FavorateIconWidget() : const SizedBox(),
    );
  }
}
