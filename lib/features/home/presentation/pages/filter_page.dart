import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/makers_section_filter.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/year_section_filter.dart';

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
            const TransmissionSection()
          ],
        ),
      ),
    );
  }
}
