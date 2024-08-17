import 'package:flutter/material.dart';
import 'package:werewolf_cars/common/constants/constants.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/car_type_item.dart';

class CarTypeListView extends StatefulWidget {
  const CarTypeListView({super.key});

  @override
  State<CarTypeListView> createState() => _CarTypeListViewState();
}

class _CarTypeListViewState extends State<CarTypeListView> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: svgCarType.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: CarTypeItem(
            isSelected: selectedIndex == index,
            svg: svgCarType[index],
          ),
        );
      },
    );
  }
}
