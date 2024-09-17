import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/my_cars_list_view_builder.dart';

class SellMyCarPage extends StatelessWidget {
  const SellMyCarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(
        text: 'Sell My Car',
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          AppText(
            "Car for sale",
          ),
        ],
      ),
    );
  }
}
