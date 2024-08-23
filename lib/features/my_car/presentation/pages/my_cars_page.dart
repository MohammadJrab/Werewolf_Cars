import 'package:flutter/material.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/car_mini_details_card_widget.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/my_cars_list_view_builder.dart';

class MyCarsPage extends StatelessWidget {
  const MyCarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(
        text: 'My Cars',
      ),
      body: Column(
        children: [
          Expanded(
            child: MyCarsListViewBuilder(),
          ),
        ],
      ),
    );
  }
}
