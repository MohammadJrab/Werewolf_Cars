import 'package:flutter/material.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/features/profile/presentation/widgets/custom_text_button.dart';

class YesNoButtons extends StatelessWidget {
  const YesNoButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomTextButton(
          text: 'Cancel',
          colorBackground: AppColors.white,
          colorFont: AppColors.black,
        ),
        CustomTextButton(
          text: 'Yes',
          colorFont: AppColors.white,
          colorBackground: AppColors.primary,
        )
      ],
    );
  }
}
