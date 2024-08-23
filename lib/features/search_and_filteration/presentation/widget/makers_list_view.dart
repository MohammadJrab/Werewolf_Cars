import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/common/constants/constants.dart';
import 'package:werewolf_cars/common/enums/car_makers.dart';

import 'maker_item_filter_widget.dart';

class MakersListView extends StatelessWidget {
  const MakersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: CarMaker.values.length,
      itemBuilder: (context, index) => MakerItemFilterWidget(
        makersLogoPath: CarMaker.values[index].logoAsset,
        onTap: () {},
      ),
    );
  }
}
