part of 'search_cubit.dart';

@immutable
class SearchState {
  final List<String> selectedCarMakersFilter;
  final int selectedCarMinYear;
  final int selectedCarMaxYear;
  final String? selectedPrice;
  final String? selectedTransmission;
  final String? seletedBodyType;
  final String? seletedFuelType;
  final String? seletedCylinders;
  final String? seletedSeatsCount;
  final List<String> seletedColors;
  final String? seletedCondition;
  const SearchState({
    this.selectedCarMinYear = 0,
    this.selectedCarMaxYear = 0,
    this.selectedCarMakersFilter = const [],
    this.selectedPrice,
    this.selectedTransmission,
    this.seletedBodyType,
    this.seletedFuelType,
    this.seletedCylinders,
    this.seletedSeatsCount,
    this.seletedColors = const [],
    this.seletedCondition,
  });

  SearchState copyWith({
    List<String>? selectedCarMakersFilter,
    int? selectedCarMinYear,
    int? selectedCarMaxYear,
    String? selectedPrice,
    String? selectedTransmission,
    String? seletedBodyType,
    String? seletedFuelType,
    String? seletedCylinders,
    String? seletedSeatsCount,
    List<String>? seletedColors,
    String? seletedCondition,
  }) {
    return SearchState(
      selectedCarMakersFilter:
          selectedCarMakersFilter ?? this.selectedCarMakersFilter,
      selectedCarMinYear: selectedCarMinYear ?? this.selectedCarMinYear,
      selectedCarMaxYear: selectedCarMaxYear ?? this.selectedCarMaxYear,
      selectedPrice: selectedPrice ?? this.selectedPrice,
      selectedTransmission: selectedTransmission ?? this.selectedTransmission,
      seletedBodyType: seletedBodyType ?? this.seletedBodyType,
      seletedFuelType: seletedFuelType ?? this.seletedFuelType,
      seletedCylinders: seletedCylinders ?? this.seletedCylinders,
      seletedSeatsCount: seletedSeatsCount ?? this.seletedSeatsCount,
      seletedColors: seletedColors ?? this.seletedColors,
      seletedCondition: seletedCondition ?? this.seletedCondition,
    );
  }
}
