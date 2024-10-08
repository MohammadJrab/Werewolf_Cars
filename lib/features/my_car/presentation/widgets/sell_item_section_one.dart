import 'package:flutter/cupertino.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/animated_dialog.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/makers_dialog.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/sell_car_item.dart';

class SellItemSectionOne extends StatelessWidget {
  const SellItemSectionOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SellCarItem(
          title: 'Make',
          value: 'BMW',
          onTap: () {
            AnimatedDialog.show(context,
                insetPadding:
                    HWEdgeInsets.only(top: 60, left: 40, right: 40, bottom: 30),
                child: const CarsMakersDialog(),
                barrierDismissible: true,
                barrierLabel: "MakersDialog");
          },
        ),
        const SellCarItem(
          title: 'Model',
          value: 'M4 Competition',
        ),
        const SellCarItem(
          title: 'Engine Variant',
          value: '3.0L Twin-Turbo Inline-6',
        ),
        const SellCarItem(
          title: 'Year',
          value: '2023',
        ),
        const SellCarItem(
          title: 'Transmission',
          value: 'Automatic',
        ),
        const SellCarItem(
          title: 'Mileage',
          value: '12,500 KM',
        ),
        const SellCarItem(
          title: 'Fuel Type',
          value: 'Petrol',
        ),
      ],
    );
  }
}
