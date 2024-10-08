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
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/makers_section_filter.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/year_section_filter.dart';

import '../widget/car_type_item.dart';
import '../widget/car_type_list_view_state.dart';
import '../widget/car_type_section.dart';
import '../widget/color_item.dart';
import '../widget/colors_list_view_state.dart';
import '../widget/colors_section.dart';
import '../widget/condition_list_view_state.dart';
import '../widget/condition_section.dart';
import '../widget/custom_slider_widget_state.dart';
import '../widget/cylinders_and_doors_list_view_state.dart';
import '../widget/cylinders_and_doors_section.dart';
import '../widget/fuel_type_list_view_state.dart';
import '../widget/fuel_type_section.dart';
import '../widget/price_section.dart';
import '../widget/suggestions_item.dart';
import '../widget/transmission_item_widget.dart';
import '../widget/transmission_list_view_state.dart';
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          print("`123 FilterPage constraints: $constraints");
          return const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                MakersSectionFilter(),
                YearSectionFilter(),
                PriceSection(),
                TransmissionSection(),
                CarTypeSection(),
                FuelTypeSection(),
                CylindersAndDoorsSection(title: 'Cylinders'),
                CylindersAndDoorsSection(title: 'Doors'),
                ColorsSection(),
                ConditionSection(),
              ],
            ),
          );
        },
      ),
    );
  }
}
