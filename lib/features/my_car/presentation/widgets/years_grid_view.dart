import 'package:flutter/cupertino.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/year_item.dart';

class YearsGridView extends StatelessWidget {
  const YearsGridView({
    super.key,
    required this.nowYear,
    required this.startYear,
    required this.currentYear,
    required this.onYearChanged,
  });

  final int nowYear;
  final int startYear;
  final int currentYear;
  final ValueChanged<int> onYearChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 8,
            mainAxisSpacing: 16,
            childAspectRatio: 25 / 15.5,
            crossAxisCount: 3),
        itemCount: (nowYear - startYear) + 1,
        itemBuilder: (context, index) {
          final year = startYear + index;
          return YearItem(
              year: year,
              currentYear: currentYear,
              onYearChanged: onYearChanged);
        },
      ),
    );
  }
}
