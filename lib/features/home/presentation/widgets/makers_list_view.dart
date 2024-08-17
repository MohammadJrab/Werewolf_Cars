import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/common/constants/constants.dart';

import 'maker_item_filter_widget.dart';

class MakersListView extends StatefulWidget {
  const MakersListView({super.key});

  @override
  State<MakersListView> createState() => _MakersListViewState();
}

class _MakersListViewState extends State<MakersListView> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: makersLogos.length,
        itemBuilder: (context, index) => MakerItemFilterWidget(
          isSelected: selectedIndex == index,
          makersLogoPath: makersLogos[index],
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
