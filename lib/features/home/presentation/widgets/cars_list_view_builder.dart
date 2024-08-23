import 'package:flutter/material.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/car_mini_details_card_widget.dart';

class CarsListViewBuilder extends StatelessWidget {
  final Axis scrollDirection;
  final EdgeInsetsGeometry padding;
  const CarsListViewBuilder({
    super.key,
    required this.scrollDirection,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: scrollDirection,
      itemCount: 4,
      itemBuilder: (context, index) => Padding(
        padding: padding,
        child: const CarMiniDetailsCardWidget(),
      ),
    );
  }
}
