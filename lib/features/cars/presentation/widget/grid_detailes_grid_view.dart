import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/common/constants/constants.dart';
import 'package:werewolf_cars/features/cars/presentation/pages/car_details_page.dart';
import 'package:werewolf_cars/features/cars/presentation/widget/grid_detailes_grid_item.dart';

class GridDetailesGridView extends StatelessWidget {
  const GridDetailesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        addAutomaticKeepAlives: false,
        shrinkWrap: true,
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 40,
            mainAxisSpacing: 0,
            childAspectRatio: 1),
        itemBuilder: (context, index) => GridDetailesGridItem(
          path: carDetailsGridItems[index],
          title: 'title',
        ),
      ),
    );
  }
}
