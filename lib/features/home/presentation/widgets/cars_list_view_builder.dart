import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/car_mini_details_card_widget.dart';
import 'package:werewolf_cars/generated/assets.dart';

import '../../../search_and_filteration/presentation/manager/search_cubit/search_cubit.dart';
import '../../domain/entity/car_entity.dart';

class CarsListViewBuilder extends StatelessWidget {
  final Axis scrollDirection;
  final EdgeInsetsGeometry padding;

  const CarsListViewBuilder({
    Key? key,
    required this.scrollDirection,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // استدعاء fetchCars هنا
    context.read<SearchCubit>().fetchCars();

    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final List<Car>? cars = state.carsLoaded;
        if (cars != null) {
          return ListView.builder(
            scrollDirection: scrollDirection,
            padding: scrollDirection == Axis.vertical
                ? const EdgeInsets.only(bottom: 20, left: 10, right: 10)
                : null,
            itemCount: cars.length,
            itemBuilder: (context, index) {
              final Car car = cars[index];
              log("car is $index:: $car");

              return Padding(
                padding: padding,
                child: CarMiniDetailsCardWidget(car: car),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
