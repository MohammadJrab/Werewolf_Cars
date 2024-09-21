import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:werewolf_cars/common/enums/vehicle_types.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/custom_radio_button.dart';

class VehicleTypeListView extends StatefulWidget {
  final List<VehicleType> items;

  final void Function(String)? onItemSelected;

  const VehicleTypeListView({
    super.key,
    required this.items,
    this.onItemSelected,
  });

  @override
  State<VehicleTypeListView> createState() => _VehicleTypeListViewState();
}

class _VehicleTypeListViewState extends State<VehicleTypeListView> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: HWEdgeInsets.only(bottom: 20),
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final item = widget.items[index];
        return Padding(
          padding: HWEdgeInsets.only(top: 16),
          child: CustomRadioButton(
            title: item.name,
            leading: AppSvgPicture(
              item.asset,
              width: 35.w,
            ),
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              if (widget.onItemSelected != null) {
                widget.onItemSelected!(item.name);
              }
              Future.delayed(
                const Duration(milliseconds: 200),
                () => context.pop(),
              );
            },
          ),
        );
      },
    );
  }
}
