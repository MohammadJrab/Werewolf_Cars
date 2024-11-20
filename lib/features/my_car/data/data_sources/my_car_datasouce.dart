import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/core/api/api_utils.dart';
import 'package:werewolf_cars/core/api/result.dart';
import 'package:werewolf_cars/core/utils/firebase_storage_helper.dart';
import 'package:werewolf_cars/features/my_car/domain/usecases/sell_my_car_usecase.dart';

@injectable
class MyCarDatasouce {
  Future<Result<bool>> sellMyCar(SellMyCarParams params) async {
    Future<bool> fun() async {
      final List<String> uploadedUrls = [];
      for (final image in params.carImages) {
        if (image != null) {
          final url = await FirebaseStorageHelper.uploadFile(
            image,
            'car_images/${DateTime.now().millisecondsSinceEpoch}_${image.path.split('/').last}',
          );
          uploadedUrls.add(url);
        }
      }
      final carData = params.toMapWithUrls(uploadedUrls);

      final carDoc = FirebaseFirestore.instance.collection('cars').doc();
      await carDoc.set(carData);

      return true;
    }

    return toApiResult(() => throwAppException(fun));
  }
}
