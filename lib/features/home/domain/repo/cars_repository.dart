
import '../entity/car_entity.dart';

abstract class  CarsRepository {
  Future<List<Car>> fetchCars();
 
}
