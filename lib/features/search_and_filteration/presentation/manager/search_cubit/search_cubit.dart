import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/common/enums/budget_filter.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/core/utils/debouncer.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'search_state.dart';

@lazySingleton
class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState()) {
    _initStreams();
  }

  final form = FormGroup({"searchCars": FormControl()});
  late StreamSubscription carsSearchStream;
  final Debounce debounce = Debounce();
  @override
  Future<void> close() {
    carsSearchStream.cancel();
    return super.close();
  }

  void _initStreams() {
    carsSearchStream = form.control('searchCars').valueChanges.listen(
      (event) {
        debounce.run(() {});
      },
      onError: _handleError,
    );
  }

  void toggleMakerSelection(String carMaker) {
    final currentSelected = List<String>.from(state.selectedCarMakersFilter);
    if (currentSelected.contains(carMaker)) {
      currentSelected.remove(carMaker);
    } else {
      currentSelected.add(carMaker);
    }
    emit(state.copyWith(selectedCarMakersFilter: currentSelected));
  }

  void resetMakerSelection() {
    emit(state.copyWith(selectedCarMakersFilter: []));
  }

  void selectPrice(BudgetFiltertype? item) {
    emit(state.copyWith(selectedPrice: item?.name));
  }

  void selectTransmission(String? transmissionType) {
    emit(state.copyWith(selectedTransmission: transmissionType));
  }

  void selectBodyType(String? bodyType) {
    emit(state.copyWith(seletedBodyType: bodyType));
  }

  void selectCylinders(String? cylinders) {
    emit(state.copyWith(seletedCylinders: cylinders));
  }

  void selectSeats(String? seatsCount) {
    emit(state.copyWith(seletedSeatsCount: seatsCount));
  }

  void toggleColorsSelection(String carColor) {
    final currentSelected = List<String>.from(state.seletedColors);
    if (currentSelected.contains(carColor)) {
      currentSelected.remove(carColor);
    } else {
      currentSelected.add(carColor);
    }
    emit(state.copyWith(seletedColors: currentSelected));
  }

  void selectCarCondition(String? carCondition) {
    emit(state.copyWith(seletedCondition: carCondition));
  }

  void selectFuelType(String? fuelType) {
    emit(state.copyWith(seletedFuelType: fuelType));
  }

  void changeCarYearFilter({int? minYear, int? maxYear}) {
    if (minYear != null) {
      emit(state.copyWith(selectedCarMinYear: minYear));
    } else if (maxYear != null) {
      emit(state.copyWith(selectedCarMaxYear: maxYear));
    }
  }

  void resetYearFilter({bool? minYear, bool? maxYear}) {
    if (minYear != null && minYear) {
      emit(state.copyWith(selectedCarMinYear: 0));
    } else if (maxYear != null && maxYear) {
      emit(state.copyWith(selectedCarMaxYear: 0));
    }
    GRouter.router.pop();
  }

  // favoriteItemToggle(CarViewModel car) async {
  //   try {
  //     car.isFavorite.value = !car.isFavorite.value;

  //     final result = await _favoriteItemToggleUsecase(
  //         FavoriteItemToggleParams(carId: car.car.id.toString()));

  //     result.fold(
  //       (exception, message) {
  //         car.isFavorite.value = !car.isFavorite.value;
  //       },
  //       (value) => null,
  //     );
  //   } catch (e) {
  //     car.isFavorite.value = !car.isFavorite.value;
  //   }
  // }

  // onShowCar(String carId) async {
  //   emit(state.copyWith(showCarDetailsState: const PageState.loading()));

  //   final response = await _showCarUsecase(carId);

  //   response.fold(
  //     (exception, message) {
  //       emit(state.copyWith(
  //           showCarDetailsState: PageState.error(exception: exception)));
  //     },
  //     (value) {
  //       emit(state.copyWith(
  //           showCarDetailsState: PageState.loaded(
  //               data: CarViewModel(
  //                  carDetails: value.data!.car))));

  //     },
  //   );
  // }

  void _handleError(error) {
    if (kDebugMode) {
      print('Error in stream: $error');
    }
  }
}
