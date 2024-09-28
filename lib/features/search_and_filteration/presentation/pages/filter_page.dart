import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/makers_section_filter.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/seats_section.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/year_section_filter.dart';
import '../widget/car_type_section.dart';
import '../widget/colors_section.dart';
import '../widget/condition_section.dart';
import '../widget/cylinders_section.dart';
import '../widget/fuel_type_section.dart';
import '../widget/price_section.dart';
import '../widget/transmission_section.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        text: 'Filter',
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            const MakersSectionFilter(),
            const YearSectionFilter(),
            const PriceSection(),
            const TransmissionSection(),
            const CarTypeSection(),
            const FuelTypeSection(),
            const CylindersSection(),
            const SeatsSection(),
            const ColorsSection(),
            const ConditionSection(),
          ],
        ),
      ),
    );
  }
}
