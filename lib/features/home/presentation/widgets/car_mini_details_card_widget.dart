import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';

import '../../../app/presentation/widgets/bottom_section_car_mini_details_card.dart';
import '../../../app/presentation/widgets/status_section_widget.dart';
import '../../../app/presentation/widgets/top_secrion_car_mini_details_card.dart';

class CarMiniDetailsCardWidget extends StatelessWidget {
  const CarMiniDetailsCardWidget(
      {super.key, this.isFaviorateIcon = true, this.isStatus = false});
  final bool isFaviorateIcon;
  final bool isStatus;

  @override
  Widget build(BuildContext context) {
    double h = isStatus ? 215.h + 50.h : 215.h;
    return GestureDetector(
      onTap: () =>
          GRouter.router.pushNamed(GRouter.config.homeRoutes.carDetails),
      child: Container(
        height: h,
        width: 320.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.greyStroke, width: 1.5.w),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TopSecrionCarMiniDetailsCard(isFaviorateIcon: isFaviorateIcon),
            const BottomSectionCarMiniDetailsCard(),
            StatusSectionWidget(isStatus: isStatus)
          ],
        ),
      ),
    );
  }
}
