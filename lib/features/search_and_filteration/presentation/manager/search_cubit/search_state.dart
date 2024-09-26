part of 'search_cubit.dart';

@immutable
class SearchState {
  final List<String> selectedCarMakersFilter;
  final int? selectedCarMinYear;
  final int? selectedCarMaxYear;
  const SearchState(
      {this.selectedCarMinYear,
      this.selectedCarMaxYear,
      this.selectedCarMakersFilter = const []});

  SearchState copyWith(
      {List<String>? selectedCarMakersFilter,
      int? selectedCarMinYear,
      int? selectedCarMaxYear}) {
    return SearchState(
      selectedCarMakersFilter:
          selectedCarMakersFilter ?? this.selectedCarMakersFilter,
      selectedCarMinYear: selectedCarMinYear ?? this.selectedCarMinYear,
      selectedCarMaxYear: selectedCarMaxYear ?? this.selectedCarMaxYear,
    );
  }
}
