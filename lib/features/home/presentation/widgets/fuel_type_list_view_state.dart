import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/transmission_item_widget.dart';
class FuelTypeListView extends StatefulWidget {
  const FuelTypeListView({super.key});

  @override
  State<FuelTypeListView> createState() => _FuelTypeListViewState();
}

class _FuelTypeListViewState extends State<FuelTypeListView> {
  String? _selectedTransmission;

  void _onItemSelected(String title) {
    setState(() {
      _selectedTransmission = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        TextWithBorderItemWidget(
          title: 'Diesel',
          isSelected: _selectedTransmission == 'Diesel',
          onTap: () => _onItemSelected('Diesel'),
        ),
        TextWithBorderItemWidget(
          title: 'Electric',
          isSelected: _selectedTransmission == 'Electric',
          onTap: () => _onItemSelected('Electric'),
        ),
        TextWithBorderItemWidget(
          title: 'Hybrid',
          isSelected: _selectedTransmission == 'Hybrid',
          onTap: () => _onItemSelected('Hybrid'),
        ),
        TextWithBorderItemWidget(
          title: 'Petrol',
          isSelected: _selectedTransmission == 'Petrol',
          onTap: () => _onItemSelected('Petrol'),
        ),
        10.horizontalSpace,
      ],
    );
  }
}
