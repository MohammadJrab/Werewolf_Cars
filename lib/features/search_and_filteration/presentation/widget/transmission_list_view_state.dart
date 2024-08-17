import 'package:flutter/material.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/pages/filter_page.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/transmission_item_widget.dart';

class TransmissionListView extends StatefulWidget {
  const TransmissionListView({super.key});

  @override
  State<TransmissionListView> createState() => _TransmissionListViewState();
}

class _TransmissionListViewState extends State<TransmissionListView> {
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
          title: 'Automatic',
          isSelected: _selectedTransmission == 'Automatic',
          onTap: () => _onItemSelected('Automatic'),
        ),
        TextWithBorderItemWidget(
          title: 'Manual',
          isSelected: _selectedTransmission == 'Manual',
          onTap: () => _onItemSelected('Manual'),
        ),
        TextWithBorderItemWidget(
          title: 'Other',
          isSelected: _selectedTransmission == 'Other',
          onTap: () => _onItemSelected('Other'),
        ),
      ],
    );
  }
}
