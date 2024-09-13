import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/features/cars/presentation/pages/car_details_page.dart';
import 'package:werewolf_cars/features/cars/presentation/widget/car_details_item.dart';
import 'package:werewolf_cars/features/cars/presentation/widget/car_name_and_price_row_widget.dart';
import 'package:werewolf_cars/features/cars/presentation/widget/grid_detailes_grid_view.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';

class CarDetailsSection extends StatelessWidget {
  const CarDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const CarNameAndPriceRowWidget(),
          const WhiteDivider(color: AppColors.whiteLess, thickness: 2),
          20.verticalSpace,
          const GridDetailesGridView(),
          const WhiteDivider(color: AppColors.whiteLess, thickness: 2),
          const CarDetailsItem(title: 'Brand', value: 'Ferrari'),
          const CarDetailsItem(title: 'Model', value: 'Ferrari'),
          const CarDetailsItem(title: 'Year Model', value: 'Ferrari'),
          const CarDetailsItem(title: 'Trim', value: 'Ferrari'),
          const CarDetailsItem(title: 'Paint Parts', value: 'Ferrari'),
          const CarDetailsItem(title: 'Seat Number', value: 'Ferrari'),
          const CarDetailsItem(title: 'Plate', value: 'Ferrari'),
          const CarDetailsItem(title: 'Color', value: 'Ferrari'),
          const CarDetailsItem(title: 'Seat Material', value: 'Ferrari'),
          const CarDetailsItem(title: 'Condition', value: 'Ferrari'),
          const CarDetailsItem(title: 'Wheels', value: 'Ferrari'),
          const CarDetailsItem(title: 'Vehicle Type', value: 'Ferrari'),
          const CarDetailsItem(title: 'Gearbox', value: 'Ferrari'),
          const CarDetailsItem(title: 'Cylinders', value: 'Ferrari'),
          const CarDetailsItem(title: 'Interior Color', value: 'Ferrari'),
          const CarDetailsItem(title: 'Exterior Color', value: 'Ferrari'),
          const CarDetailsItem(title: 'Location', value: 'Ferrari'),
          10.verticalSpace,
        ],
      ),
    );
  }
}
