import 'package:flutter/cupertino.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/sell_car_item.dart';

class SellItemSectionTwo extends StatelessWidget {
  const SellItemSectionTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SellCarItem(
          title: 'Trim',
          value: 'Carbon fiber package',
        ),
        SellCarItem(
          title: 'Cylinders',
          value: '6',
        ),
        SellCarItem(
          title: 'Seats Number',
          value: '4',
        ),
        SellCarItem(
          title: 'Paint Parts',
          value: 'Full body original',
        ),
        SellCarItem(
          title: 'Condition',
          value: 'Used',
        ),
        SellCarItem(
          title: 'Plate',
          value: 'Munich',
        ),
        SellCarItem(
          title: 'Color',
          value: 'White',
        ),
      ],
    );
  }
}
