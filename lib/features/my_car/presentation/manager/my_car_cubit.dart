import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/common/enums/car_makers.dart';
import 'package:werewolf_cars/core/utils/nullable.dart';

part 'my_car_state.dart';

@lazySingleton
class MyCarCubit extends Cubit<MyCarCubitState> {
  MyCarCubit() : super(const MyCarCubitState());

  void updateCarMaker(CarMaker carMaker) {
    emit(state.copyWith(selectedCarMakers: Nullable.value(carMaker)));
  }
}
