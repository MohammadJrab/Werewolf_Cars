import 'package:flutter/material.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/cars_list_view_builder.dart';

class FavioratePage extends StatelessWidget {
  const FavioratePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        text: 'Faviorate',
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: CarsListViewBuilder(
              scrollDirection: Axis.vertical,
              padding:
                  HWEdgeInsetsDirectional.only(start: 14, end: 14, top: 20),
            ),
          ),
        ],
      ),
    );
  }
}
