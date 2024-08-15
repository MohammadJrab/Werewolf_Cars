import 'package:flutter/material.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/circlue_user_image_widget.dart';

class UserImageWithEdit extends StatelessWidget {
  const UserImageWithEdit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          const CirclueUserImageWidget(
            height: 90,
            width: 90,
          ),
          Positioned(
              bottom: 4,
              right: 4,
              child: Container(
                padding: HWEdgeInsets.all(1.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                ),
                child: const Icon(
                  Icons.edit_outlined,
                  color: AppColors.blackLight,
                ),
              ))
        ],
      ),
    );
  }
}
