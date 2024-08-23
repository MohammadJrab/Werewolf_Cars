import 'package:werewolf_cars/generated/assets.dart';

enum CarType {
  coupe('Coupe', Assets.svgCoupeCar),
  sports('Sports', Assets.svgSportsCar),
  superCar('Super', Assets.svgSuperCar),
  suv('SUV', Assets.svgSuvCar),
  sedan('Sedan', Assets.svgSedanCar),
  micro('Micro', Assets.svgMicroCar),

  hatchback('Hatchback', Assets.svgHatchbackCar),
  pickup('Pickup', Assets.svgPickupCar),
  roadster('Roadster', Assets.svgRoadsterCar),
  station('Station', Assets.svgStationCar),
  van('Van', Assets.svgVanCar),
  limousine('Limousine', Assets.svgLimousineCar);

  final String name;
  final String asset;

  const CarType(this.name, this.asset);
}
