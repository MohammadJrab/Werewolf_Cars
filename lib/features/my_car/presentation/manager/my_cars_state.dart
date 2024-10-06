part of 'my_cars_bloc.dart';

class MyCarsState {
  final int activeStep;

  @override
  List<Object?> get props => [
        activeStep,
      ];
  const MyCarsState({
    this.activeStep = 0,
  });

  factory MyCarsState.initial() {
    return const MyCarsState(
      activeStep: 0,
    );
  }

  MyCarsState copyWith({
    int? activeStep,
  }) {
    return MyCarsState(
      activeStep: activeStep ?? this.activeStep,
    );
  }
}
