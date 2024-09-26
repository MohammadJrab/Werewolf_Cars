part of 'my_car_cubit.dart';

@immutable
class MyCarCubitState {
  final CarMaker? selectedCarMakers;
  const MyCarCubitState({this.selectedCarMakers});

  MyCarCubitState copyWith({Nullable<CarMaker?>? selectedCarMakers}) {
    return MyCarCubitState(
        selectedCarMakers: selectedCarMakers != null
            ? selectedCarMakers.value
            : this.selectedCarMakers);
  }
}
