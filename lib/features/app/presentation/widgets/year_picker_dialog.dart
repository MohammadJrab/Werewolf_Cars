import 'package:flutter/material.dart';

class YearPickerDialog extends StatelessWidget {
  final int currentYear;
  final ValueChanged<int> onYearChanged;

  const YearPickerDialog({
    super.key,
    required this.currentYear,
    required this.onYearChanged,
  });

  @override
  Widget build(BuildContext context) {
    final int nowYear = DateTime.now().year;
    const int startYear = 1900; // Starting year

    return AlertDialog(
      title: const Text('Select Year'),
      content: SizedBox(
        height: 300,
        width: double.maxFinite,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: (nowYear - startYear) + 1,
          itemBuilder: (context, index) {
            final year = startYear + index;
            return ListTile(
              title: Text(year.toString()),
              selected: year == currentYear,
              onTap: () {
                onYearChanged(year);
                Navigator.of(context).pop();
              },
            );
          },
        ),
      ),
    );
  }
}
