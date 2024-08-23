import 'package:flutter/material.dart';
import 'package:werewolf_cars/common/enums/budget_filter.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/budget_item.dart';

class BudgetListView extends StatelessWidget {
  const BudgetListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: BudgetFiltertype.values.length,
      itemBuilder: (context, index) {
        final item = BudgetFiltertype.values[index];
        return BudgetItem(title: item.title, range: item.range, onTap: () {});
      },
    );
  }
}
