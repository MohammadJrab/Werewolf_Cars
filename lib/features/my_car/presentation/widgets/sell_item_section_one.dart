import 'package:flutter/cupertino.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/sell_car_item.dart';

class SellItemSectionOne extends StatelessWidget {
  const SellItemSectionOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SellCarItem(
          title: 'Make',
          value: 'BMW',
        ),
        SellCarItem(
          title: 'Model',
          value: 'M4 Competition',
        ),
        SellCarItem(
          title: 'Engine Variant',
          value: '3.0L Twin-Turbo Inline-6',
        ),
        SellCarItem(
          title: 'Year',
          value: '2023',
        ),
        SellCarItem(
          title: 'Transmission',
          value: 'Automatic',
        ),
        SellCarItem(
          title: 'Mileage',
          value: '12,500 KM',
        ),
        SellCarItem(
          title: 'Fuel Type',
          value: 'Petrol',
        ),
      ],
    );
  }
}
