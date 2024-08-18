import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';

import 'bottom_section_car_mini_details_card.dart';
import 'status_section_widget.dart';
import 'top_secrion_car_mini_details_card.dart';

class CarMiniDetailsCardWidget extends StatelessWidget {
  const CarMiniDetailsCardWidget(
      {super.key, this.isFaviorateIcon = true, this.isStatus = false});
  final bool isFaviorateIcon;
  final bool isStatus;

  @override
  Widget build(BuildContext context) {
    double h = isStatus ? 240.h + 50.h : 240.h;
    return Container(
      height: h,
      width: 320.w,
      margin: HWEdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.blackLight,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.white, width: 1.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TopSecrionCarMiniDetailsCard(isFaviorateIcon: isFaviorateIcon),
          const BottomSectionCarMiniDetailsCard(),
          StatusSectionWidget(isStatus: isStatus)
        ],
      ),
    );
  }
}
