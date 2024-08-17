import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      height: 130.h,
      alignment: Alignment.topRight,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(Assets.imagesWelcomeFerrari),
        fit: BoxFit.cover,
      )),
      child: isFaviorateIcon ? const FavorateIconWidget() : const SizedBox(),
    );
  }
}
