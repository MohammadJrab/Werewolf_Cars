import 'package:flutter/cupertino.dart';
import 'package:werewolf_cars/common/enums/car_makers.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/makers_list_tile_item.dart';

class MakersListTileListView extends StatelessWidget {
  final List<CarMaker> carMakers;

  const MakersListTileListView({super.key, required this.carMakers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: carMakers.length,
      itemBuilder: (context, index) {
        final carMaker = carMakers[index];
        return MakerListTileItem(context: context, name: carMaker.name);
      },
    );
  }
}
