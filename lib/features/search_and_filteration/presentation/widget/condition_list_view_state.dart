import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/transmission_item_widget.dart';

class ConditionListView extends StatefulWidget {
  const ConditionListView({super.key});

  @override
  State<ConditionListView> createState() => _ConditionListViewState();
}

class _ConditionListViewState extends State<ConditionListView> {
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
          title: 'All',
          isSelected: _selectedTransmission == 'All',
          onTap: () => _onItemSelected('All'),
        ),
        TextWithBorderItemWidget(
          title: 'New',
          isSelected: _selectedTransmission == 'New',
          onTap: () => _onItemSelected('New'),
        ),
        TextWithBorderItemWidget(
          title: 'Used',
          isSelected: _selectedTransmission == 'Used',
          onTap: () => _onItemSelected('Used'),
        ),
        10.horizontalSpace,
      ],
    );
  }
}
