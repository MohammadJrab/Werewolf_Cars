import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entity/car_entity.dart';
import '../../domain/repo/cars_repository.dart';

class CarsRepositoryImpl implements CarsRepository {
  final FirebaseFirestore firestore;

  CarsRepositoryImpl(this.firestore);

  @override
  Future<List<Car>> fetchCars() async {
    final snapshot = await firestore.collection('cars').get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return Car(
        color: data['carColor'] ?? '',
        condition: data['carCondition'] ?? '',
        cylinders: data['carCylinders'] ?? '',
        engine: data['carEngine'] ?? '',
        exteriorColor: data['carExteriorColor'] ?? '',
        fuelType: data['carFuelType'] ?? '',
        images: List<String>.from(data['carImages'] ?? []),
        interiorColor: data['carInteriorColor'] ?? '',
        maker: data['carMaker'] ?? '',
        mileage: data['carMileage'] ?? '',
        model: data['carModel'] ?? '',
        paintParts: data['carPaintParts'] ?? '',
        plate: data['carPlate'] ?? '',
        seatMaterial: data['carSeatMaterial'] ?? '',
        seats: data['carSeats'] ?? '',
        transmission: data['carTransmission'] ?? '',
        trim: data['carTrim'] ?? '',
        vehicleType: data['carVehicleType'] ?? '',
        wheels: data['carWheels'] ?? '',
        year: data['carYear'] ?? '',
        createAt: data['createAt'] ?? '',
        location: data['location'] ?? '',
        status: data['status'] ?? '',
        updateAt: data['updateAt'] ?? '',
        userId: data['userId'] ?? '',
        warranty: data['warranty'],
      );
    }).toList();
  }

}
