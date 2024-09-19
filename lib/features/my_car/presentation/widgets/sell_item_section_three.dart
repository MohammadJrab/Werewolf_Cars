import 'package:flutter/cupertino.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/sell_car_item.dart';

class SellItemSectionThree extends StatelessWidget {
  const SellItemSectionThree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SellCarItem(
          title: 'Seat Material',
          value: 'Merino Leather',
        ),
        SellCarItem(
          title: 'Wheels',
          value: '19',
        ),
        SellCarItem(
          title: 'Seats Number',
          value: '4',
        ),
        SellCarItem(
          title: 'Vehicle Type',
          value: 'Coupe',
        ),
        SellCarItem(
          title: 'Interior Color',
          value: 'Black',
        ),
        SellCarItem(
          title: 'Exterior Color',
          value: 'White',
        ),
        SellCarItem(
          title: 'Location',
          value: 'Munich, Germany',
        ),
      ],
    );
  }
}
