import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  String? selectedColorName;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        ColorItem(
          color: AppColors.black,
          colorName: 'black',
          isSelected: selectedColorName == 'black',
          onTap: () => _onColorSelected('black'),
        ),
        ColorItem(
          color: AppColors.grey,
          colorName: 'grey',
          isSelected: selectedColorName == 'grey',
          onTap: () => _onColorSelected('grey'),
        ),
        ColorItem(
          color: AppColors.orange,
          colorName: 'orange',
          isSelected: selectedColorName == 'orange',
          onTap: () => _onColorSelected('orange'),
        ),
        ColorItem(
          color: Colors.blue,
          colorName: 'blue',
          isSelected: selectedColorName == 'blue',
          onTap: () => _onColorSelected('blue'),
        ),
        ColorItem(
          color: AppColors.whiteLess,
          colorName: 'Beige',
          isSelected: selectedColorName == 'Beige',
          onTap: () => _onColorSelected('Beige'),
        ),
        ColorItem(
          color: AppColors.burgundy,
          colorName: 'burgundy',
          isSelected: selectedColorName == 'burgundy',
          onTap: () => _onColorSelected('burgundy'),
        ),
        ColorItem(
          color: AppColors.brown,
          colorName: 'brown',
          isSelected: selectedColorName == 'brown',
          onTap: () => _onColorSelected('brown'),
        ),
        20.horizontalSpace,
      ],
    );
  }

  void _onColorSelected(String colorName) {
    setState(() {
      selectedColorName = colorName;
    });
  }
}
