

import 'package:flutter/material.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/car_mini_details_card_widget.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';

class FavioratePage extends StatelessWidget {
  const FavioratePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.blackLight,
      appBar: CustomAppbar(
        text: 'Faviorate',
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarMiniDetailsCardWidget(),
            CarMiniDetailsCardWidget(),
            CarMiniDetailsCardWidget(),
            CarMiniDetailsCardWidget(),
            CarMiniDetailsCardWidget(),
            CarMiniDetailsCardWidget(),
            CarMiniDetailsCardWidget(),
          ],
        ),
      ),
    );
  }
}
