class Car {
  final String color;
  final String condition;
  final String cylinders;
  final String engine;
  final String exteriorColor;
  final String fuelType;
  final List<String> images;
  final String interiorColor;
  final String maker;
  final String mileage;
  final String model;
  final String paintParts;
  final String plate;
  final String seatMaterial;
  final String seats;
  final String transmission;
  final String trim;
  final String vehicleType;
  final String wheels;
  final String year;
  final String createAt;
  final String location;
  final String status;
  final String updateAt;
  final String userId;
  final String? warranty;
  final num? price;

  Car({
    required this.color,
    required this.condition,
    required this.cylinders,
    required this.engine,
    required this.exteriorColor,
    required this.fuelType,
    required this.images,
    required this.interiorColor,
    required this.maker,
    required this.mileage,
    required this.model,
    required this.paintParts,
    required this.plate,
    required this.seatMaterial,
    required this.seats,
    required this.transmission,
    required this.trim,
    required this.vehicleType,
    required this.wheels,
    required this.year,
    required this.createAt,
    required this.location,
    required this.status,
    required this.updateAt,
    required this.userId,
    this.price,
    this.warranty,
  });
}
