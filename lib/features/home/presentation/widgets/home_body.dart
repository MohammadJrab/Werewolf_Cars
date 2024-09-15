import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/body_types_filter_section.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/budget_filter_section.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/makers_filter_section.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/recommended_section.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/search_bar_button.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        10.verticalSpace,
        // SearchBar Section
        SearchBarButton(
          onTap: () {},
        ),
        // Recommended Cars ListView section
        const RecommendedSection(),
        // Browse by body type Section
        const BodyTypesFilterSection(),
        // Browse by budget section
        const BudgetFilterSection(),
        // Browse by makers section
        const MakersFilterSection(),
        35.verticalSpace,
      ]),
    );
  }
}
