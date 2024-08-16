import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/common/constants/constants.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/makers_section_filter.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/year_section_filter.dart';

import '../widgets/car_type_item.dart';
import '../widgets/car_type_list_view_state.dart';
import '../widgets/car_type_section.dart';
import '../widgets/custom_slider_widget_state.dart';
import '../widgets/price_section.dart';
import '../widgets/suggestions_item.dart';
import '../widgets/transmission_item_widget.dart';
import '../widgets/transmission_list_view_state.dart';
import '../widgets/transmission_section.dart';

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
            const FuelTypeSection()
          ],
        ),
      ),
    );
  }
}

class FuelTypeSection extends StatelessWidget {
  const FuelTypeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: HWEdgeInsets.only(left: 25),
          child: AppText(
            'Fuel type',
            style:
                context.textTheme.bodyLarge?.xb.s21.withColor(AppColors.white),
          ),
        ),
        20.verticalSpace,
        SizedBox(
          height: 46.h,
          child: const FuelTypeListView(),
        ),
        30.verticalSpace,
      ],
    );
  }
}

class FuelTypeListView extends StatefulWidget {
  const FuelTypeListView({super.key});

  @override
  State<FuelTypeListView> createState() => _FuelTypeListViewState();
}

class _FuelTypeListViewState extends State<FuelTypeListView> {
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
          title: 'Diesel',
          isSelected: _selectedTransmission == 'Diesel',
          onTap: () => _onItemSelected('Diesel'),
        ),
        TextWithBorderItemWidget(
          title: 'Electric',
          isSelected: _selectedTransmission == 'Electric',
          onTap: () => _onItemSelected('Electric'),
        ),
        TextWithBorderItemWidget(
          title: 'Hybrid',
          isSelected: _selectedTransmission == 'Hybrid',
          onTap: () => _onItemSelected('Hybrid'),
        ),
        TextWithBorderItemWidget(
          title: 'Petrol',
          isSelected: _selectedTransmission == 'Petrol',
          onTap: () => _onItemSelected('Petrol'),
        ),
        10.horizontalSpace
      ],
    );
  }
}
