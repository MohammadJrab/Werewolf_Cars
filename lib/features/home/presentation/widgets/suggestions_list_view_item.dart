import 'package:flutter/material.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/suggestions_item.dart';

class SuggestionsListViewItem extends StatelessWidget {
  const SuggestionsListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: const [
        SuggestionsItem(),
        SuggestionsItem(),
        SuggestionsItem(),
        SuggestionsItem(),
        SuggestionsItem(),
        SuggestionsItem(),
        SuggestionsItem(),
        SuggestionsItem(),
      ],
    );
  }
}
