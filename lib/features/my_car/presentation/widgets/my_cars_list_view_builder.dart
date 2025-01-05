import 'package:flutter/material.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/car_mini_details_card_widget.dart';

import '../../../home/domain/entity/car_entity.dart';

class MyCarsListViewBuilder extends StatelessWidget {
  const MyCarsListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 4,
        padding: HWEdgeInsets.only(bottom: 75),
        itemBuilder: (context, index) => Padding(
              padding: HWEdgeInsets.only(top: 20, right: 14, left: 14),
              child:  CarMiniDetailsCardWidget(
                isFaviorateIcon: false,
                isStatus: true,
                car: Car(
  color: "Sapphire Black",
  condition: "New",
  cylinders: "6",
  engine: "3.0L Twin-Turbo",
  exteriorColor: "brown",
  fuelType: "Gasoline",
  images: [
    "https://firebasestorage.googleapis.com/v0/b/werewolf-cars.appspot.com/o/car_images%2F1732094934401_Gemini_Generated_Image_t3plhct3plhct3pl.jpg?alt=media&token=0b0f621b-d959-429d-adb3-b82372ba6149",
    "https://firebasestorage.googleapis.com/v0/b/werewolf-cars.appspot.com/o/car_images%2F1732094936473_Gemini_Generated_Image_t3plhct3plhct3pl.jpg?alt=media&token=bb62cbc5-b5c0-4bee-a1d6-718d679a13b3",
    "https://firebasestorage.googleapis.com/v0/b/werewolf-cars.appspot.com/o/car_images%2F1732094937776_Gemini_Generated_Image_73xkwo73xkwo73xk.jpg?alt=media&token=6c3d4751-e2d5-422a-be26-cea2f93e8ccd",
    "https://firebasestorage.googleapis.com/v0/b/werewolf-cars.appspot.com/o/car_images%2F1732094939404_Gemini_Generated_Image_1ha98h1ha98h1ha9.jpg?alt=media&token=eacbdbca-70df-4ab9-881d-f9e65e9a2054",
    "https://firebasestorage.googleapis.com/v0/b/werewolf-cars.appspot.com/o/car_images%2F1732094940790_Gemini_Generated_Image_bduz9ebduz9ebduz.jpg?alt=media&token=4b5a3166-541a-4f9a-a683-478d80d15ac5",
  ],
  interiorColor: "green",
  maker: "Audi",
  mileage: "0",
  model: "w3",
  paintParts: "Original",
  plate: "N/A",
  seatMaterial: "Leather",
  seats: "4",
  transmission: "Manual",
  trim: "Competition",
  vehicleType: "Coupe",
  wheels: "19\" Alloy",
  year: "2010",
  createAt: "2024-11-20T12:28:54.395142",
  location: "Dubai",
  status: "Available",
  updateAt: "2024-11-20T12:28:54.395147",
  userId: "VWp80XtCS6gTqkus5Zmi8Ph45MP2",
  warranty: null,
),
              ),
            ));
  }
}
