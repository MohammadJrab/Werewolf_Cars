import 'package:flutter/material.dart';
import 'package:werewolf_cars/common/enums/car_makers.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/widget/maker_item_filter_widget.dart';

class MakersListViewHome extends StatelessWidget {
  const MakersListViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: CarMaker.values.length,
      padding: HWEdgeInsets.only(left: 14),
      itemBuilder: (context, index) => MakerItemFilterWidget(
        makersLogoPath: CarMaker.values[index].logoAsset,
        onTap: () {},
      ),
    );
  }
}
