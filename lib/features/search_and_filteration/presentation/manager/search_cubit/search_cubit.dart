import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
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

  void changeCarYearFilter({int? minYear, int? maxYear}) {
    if (minYear != null) {
      emit(state.copyWith(selectedCarMinYear: minYear));
    } else if (maxYear != null) {
      emit(state.copyWith(selectedCarMaxYear: maxYear));
    }
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
