import 'package:flutter/cupertino.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/car_logo_item.dart';
import 'package:werewolf_cars/generated/assets.dart';

class CarLogoSliverGrid extends StatelessWidget {
  const CarLogoSliverGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: HWEdgeInsets.only(top: 30, right: 8, left: 8),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        delegate: SliverChildListDelegate(
          [
            const CarLogoItem(
                assetPath: Assets.makersMercedes, svgColor: AppColors.white),
            const CarLogoItem(
                assetPath: Assets.makersBmwWhiteBlack, svgColor: null),
            const CarLogoItem(
                assetPath: Assets.makersVolkswagen, svgColor: AppColors.white),
            const CarLogoItem(
                assetPath: Assets.makersHonda, svgColor: AppColors.white),
            const CarLogoItem(
                assetPath: Assets.makersJeep, svgColor: AppColors.white),
            const CarLogoItem(
                assetPath: Assets.makersAudi, svgColor: AppColors.white),
          ],
        ),
      ),
    );
  }
}
