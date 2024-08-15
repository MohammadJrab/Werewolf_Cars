import 'package:flutter/material.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/car_mini_details_card_widget.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';

class MyCarsPage extends StatelessWidget {
  const MyCarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.blackLight,
      appBar: CustomAppbar(
        text: 'My Cars',
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarMiniDetailsCardWidget(
              isFaviorateIcon: false,
              isStatus: true,
            ),
            CarMiniDetailsCardWidget(
              isFaviorateIcon: false,
              isStatus: true,
            ),
            CarMiniDetailsCardWidget(
              isFaviorateIcon: false,
              isStatus: true,
            ),
            CarMiniDetailsCardWidget(
              isFaviorateIcon: false,
              isStatus: true,
            ),
            CarMiniDetailsCardWidget(
              isFaviorateIcon: false,
              isStatus: true,
            ),
            CarMiniDetailsCardWidget(
              isFaviorateIcon: false,
              isStatus: true,
            ),
            CarMiniDetailsCardWidget(
              isFaviorateIcon: false,
              isStatus: true,
            ),
            CarMiniDetailsCardWidget(
              isFaviorateIcon: false,
              isStatus: true,
            ),
            CarMiniDetailsCardWidget(
              isFaviorateIcon: false,
              isStatus: true,
            ),
          ],
        ),
      ),
    );
  }
}
