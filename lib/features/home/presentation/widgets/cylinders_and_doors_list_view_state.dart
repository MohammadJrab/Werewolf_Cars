import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/transmission_item_widget.dart';
class CylindersAndDoorsListView extends StatefulWidget {
  const CylindersAndDoorsListView({super.key});

  @override
  State<CylindersAndDoorsListView> createState() =>
      _CylindersAndDoorsListViewState();
}

class _CylindersAndDoorsListViewState extends State<CylindersAndDoorsListView> {
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
          title: 'any',
          isSelected: _selectedTransmission == 'any',
          onTap: () => _onItemSelected('any'),
        ),
        TextWithBorderItemWidget(
          title: '1',
          isSelected: _selectedTransmission == '1',
          onTap: () => _onItemSelected('1'),
        ),
        TextWithBorderItemWidget(
          title: '2',
          isSelected: _selectedTransmission == '2',
          onTap: () => _onItemSelected('2'),
        ),
        TextWithBorderItemWidget(
          title: '3',
          isSelected: _selectedTransmission == '3',
          onTap: () => _onItemSelected('3'),
        ),
        TextWithBorderItemWidget(
          title: '4',
          isSelected: _selectedTransmission == '4',
          onTap: () => _onItemSelected('4'),
        ),
        TextWithBorderItemWidget(
          title: '5',
          isSelected: _selectedTransmission == '5',
          onTap: () => _onItemSelected('5'),
        ),
        TextWithBorderItemWidget(
          title: '6',
          isSelected: _selectedTransmission == '6',
          onTap: () => _onItemSelected('6'),
        ),
        10.horizontalSpace,
      ],
    );
  }
}

