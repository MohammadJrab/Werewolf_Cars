import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/manager/search_cubit/search_cubit.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/kilometers_section_filter.dart';
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
    final bloc = GetIt.I<SearchCubit>();

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
            MakersSectionFilter(searchCubit: bloc),
            KilometersSectionFilter(searchCubit: bloc),
            YearSectionFilter(searchCubit: bloc),
            PriceSection(searchCubit: bloc),
            TransmissionSection(searchCubit: bloc),
            CarTypeSection(searchCubit: bloc),
            FuelTypeSection(searchCubit: bloc),
            CylindersSection(searchCubit: bloc),
            SeatsSection(searchCubit: bloc),
            ColorsSection(searchCubit: bloc),
            ConditionSection(searchCubit: bloc),
            50.verticalSpace,
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton.extended(
              autofocus: true,
              label: Padding(
                padding: HWEdgeInsets.symmetric(horizontal: 36),
                child: AppText(
                  "Apply",
                  style: context.textTheme.bodyMedium?.s20.b,
                ),
              ),
              heroTag: null,
              backgroundColor: AppColors.primary,
              onPressed: () => context.pop()),
          FloatingActionButton.extended(
              label: Padding(
                padding: HWEdgeInsets.symmetric(horizontal: 20),
                child: AppText(
                  "Reset",
                  style: context.textTheme.bodyMedium?.s20.b,
                ),
              ),
              heroTag: null,
              backgroundColor: AppColors.grey,
              onPressed: () {
                bloc.resetAllFilters();
                context.pop();
              }),
        ],
      ),
    );
  }
}
