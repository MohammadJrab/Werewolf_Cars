import 'dart:async';
import 'dart:io';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/common/models/page_state/page_state.dart';
import 'package:werewolf_cars/core/api/api_utils.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/core/utils/nullable.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'my_cars_event.dart';
part 'my_cars_state.dart';

@lazySingleton
class MyCarsBloc extends Bloc<MyCarsEvent, MyCarsState> {
  MyCarsBloc() : super(const MyCarsState()) {
    on<NextPageEvent>(nextPage);
    on<PreviousPageEvent>(previousPage);
    on<BackPageEvent>(back);
    on<AddOptionalImageEvent>(addOptionalImageControl);
    on<ResetSellMyCarEvent>(resetSellMyCar);
  }
  final String kFromCarMaker = 'carMaker';
  final String kFromCarModel = 'carModel';
  final String kFromCarEngine = 'carEngine';
  final String kFromCarYear = 'carYear';
  final String kFromCarTransmission = 'carTransmission';
  final String kFromCarMileage = 'carMileage';
  final String kFromCarFuelType = 'carFuelType';
  final String kFromCarTrim = 'carTrim';
  final String kFromCarCylinders = 'carCylinders';
  final String kFromCarSeats = 'carSeats';
  final String kFromCarPaintParts = 'carPaintParts';
  final String kFromCarCondition = 'carCondition';
  final String kFromCarPlate = 'carPlate';
  final String kFromCarColor = 'carColor';
  final String kFromCarSeatMaterial = 'carSeatMaterial';
  final String kFromCarWheels = 'carWheels';
  final String kFromCarVehicleType = 'carVehicleType';
  final String kFromCarInteriorColor = 'carInteriorColor';
  final String kFromCarExteriorColor = 'carExteriorColor';
  final String kFromCarSafety = 'carSafety';
  final String kFromCarExterior = 'carExterior';
  final String kFromCarInterior = 'carInterior';
  final String kFromCarDescription = 'carDescription';
  final String kFromCarPrice = 'carPrice';
  final String kFromCarLocation = 'carLocation';
  final String kFromCarImageFullRight = 'carImageFullRight';
  final String kFromCarImageFullLeft = 'carImageFullLeft';
  final String kFromCarImageRear = 'carImageRear';
  final String kFromCarImageFront = 'carImageFront';
  final String kFromCarImageDashboard = 'carImageDashboard';

  final PageController pagedSellMyCarController = PageController();

  FutureOr<void> nextPage(NextPageEvent event, Emitter<MyCarsState> emit) {
    if ((sellMyCarForm.valid && state.activeStep == 0)) {
      emit(state.copyWith(activeStep: state.activeStep + 1));
      pagedSellMyCarController.nextPage(
        duration: kTabScrollDuration,
        curve: Curves.linear,
      );
    } else if (state.activeStep == 1 && sellMyCarForm.valid) {
      emit(state.copyWith(activeStep: state.activeStep + 1));
      pagedSellMyCarController.nextPage(
        duration: kTabScrollDuration,
        curve: Curves.linear,
      );
    } else if (descriptionSectionForm.valid &&
        state.activeStep == 2 &&
        sellMyCarForm.valid) {
      emit(state.copyWith(activeStep: state.activeStep + 1));
      pagedSellMyCarController.nextPage(
        duration: kTabScrollDuration,
        curve: Curves.linear,
      );
    } else if (imagesSectionForm.valid &&
        descriptionSectionForm.valid &&
        state.activeStep == 3 &&
        sellMyCarForm.valid) {
      GRouter.router.pushNamed(GRouter.config.myCarsRoutes.congratulationsPage);
    } else {
      if (state.activeStep == 0) {
        sellMyCarForm.markAllAsTouched();
      }

      if (state.activeStep == 2) {
        sellMyCarForm.markAllAsTouched();
        descriptionSectionForm.markAllAsTouched();
      } else if (state.activeStep == 3) {
        sellMyCarForm.markAllAsTouched();
        descriptionSectionForm.markAllAsTouched();
        imagesSectionForm.markAllAsTouched();
      }
    }
  }

  previousPage(PreviousPageEvent event, Emitter<MyCarsState> emit) {
    emit(state.copyWith(activeStep: state.activeStep - 1));
    pagedSellMyCarController.previousPage(
      duration: kTabScrollDuration,
      curve: Curves.linear,
    );
  }

  back(BackPageEvent event, Emitter<MyCarsState> emit) {
    if (state.activeStep != 0) {
      add(PreviousPageEvent());
      return;
    }
    GRouter.router.pop();
  }

  late final sellMyCarForm = FormGroup({
    kFromCarMaker: FormControl<String>(
      value: 'BMW',
      validators: [Validators.required],
    ),
    kFromCarModel: FormControl<String>(
      value: 'M4',
      validators: [Validators.required],
    ),
    kFromCarEngine: FormControl<String>(
      value: '3.0L Twin-Turbo I6',
      validators: [Validators.required],
    ),
    kFromCarYear: FormControl<String>(
      value: '2024',
      validators: [Validators.required],
    ),
    kFromCarTransmission: FormControl<String>(
      value: 'Automatic',
      validators: [Validators.required],
    ),
    kFromCarMileage: FormControl<String>(
      value: '0',
      validators: [Validators.required],
    ),
    kFromCarFuelType: FormControl<String>(
      value: 'Gasoline',
      validators: [Validators.required],
    ),
    kFromCarTrim: FormControl<String>(
      value: 'Competition',
      validators: [Validators.required],
    ),
    kFromCarCylinders: FormControl<String>(
      value: '6',
      validators: [Validators.required],
    ),
    kFromCarSeats: FormControl<String>(
      value: '4',
      validators: [Validators.required],
    ),
    kFromCarPaintParts: FormControl<String>(
      value: 'Original',
      validators: [Validators.required],
    ),
    kFromCarCondition: FormControl<String>(
      value: 'New',
      validators: [Validators.required],
    ),
    kFromCarPlate: FormControl<String>(
      value: 'N/A',
      validators: [Validators.required],
    ),
    kFromCarColor: FormControl<String>(
      value: 'Sapphire Black',
      validators: [Validators.required],
    ),
    kFromCarSeatMaterial: FormControl<String>(
      value: 'Leather',
      validators: [Validators.required],
    ),
    kFromCarWheels: FormControl<String>(
      value: '19" Alloy',
      validators: [Validators.required],
    ),
    kFromCarVehicleType: FormControl<String>(
      value: 'Coupe',
      validators: [Validators.required],
    ),
    kFromCarInteriorColor: FormControl<String>(
      value: 'Black',
      validators: [Validators.required],
    ),
    kFromCarExteriorColor: FormControl<String>(
      value: 'Sapphire Black',
      validators: [Validators.required],
    ),
    kFromCarSafety: FormControl<List<String>>(
      value: ['Airbags', 'ABS', 'Lane Assist'],
    ),
    kFromCarExterior: FormControl<List<String>>(
      value: ['LED Headlights', 'Carbon Fiber Spoiler'],
    ),
    kFromCarInterior: FormControl<List<String>>(
      value: ['Heated Seats', 'Ambient Lighting'],
    ),
  });

  late final descriptionSectionForm = FormGroup({
    kFromCarDescription: FormControl<String>(
        validators: [Validators.required],
        value: "BMW 3.0L Twin-Turbo I6 2024 Automatic."),
    kFromCarPrice:
        FormControl<String>(validators: [Validators.required], value: "15000"),
    kFromCarLocation: FormControl<String>(
        validators: [Validators.required], value: "Germany"),
  });
  late final imagesSectionForm = FormGroup({
    kFromCarImageFullRight:
        FormControl<File?>(validators: [Validators.required]),
    kFromCarImageFullLeft:
        FormControl<File?>(validators: [Validators.required]),
    kFromCarImageRear: FormControl<File?>(validators: [Validators.required]),
    kFromCarImageFront: FormControl<File?>(validators: [Validators.required]),
    kFromCarImageDashboard:
        FormControl<File?>(validators: [Validators.required])
  });
  addOptionalImageControl(
      AddOptionalImageEvent event, Emitter<MyCarsState> emit) {
    if (imagesSectionForm.controls.length < 8) {
      final controlName = 'optionalImage${imagesSectionForm.controls.length}';
      imagesSectionForm.addAll({
        controlName: FormControl<File?>(),
      });
    }
  }

  resetSellMyCar(ResetSellMyCarEvent event, Emitter<MyCarsState> emit) {
    emit(state.copyWith(activeStep: 0));

    if (pagedSellMyCarController.hasClients) {
      pagedSellMyCarController.jumpToPage(0);
    }

    for (int i = imagesSectionForm.controls.length; i > 4; i--) {
      if (imagesSectionForm.contains("optionalImage$i")) {
        imagesSectionForm.removeControl("optionalImage$i");
      }
    }

    imagesSectionForm.reset();
    descriptionSectionForm.reset();
    sellMyCarForm.reset();
  }
}
