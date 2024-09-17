import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/my_cars_list_view_builder.dart';

class MyCarsPage extends StatelessWidget {
  const MyCarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: ElevatedButton(
          style: ButtonStyle(
              alignment: Alignment.center,
              minimumSize: WidgetStatePropertyAll(Size(200.w, 50.h)),
              backgroundColor: const WidgetStatePropertyAll(AppColors.white)),
          onPressed: () {
            GRouter.router.pushNamed(GRouter.config.myCarsRoutes.sellMyCarPage);
          },
          child: const AppText("Sell My Car")),
      appBar: const CustomAppbar(
        text: 'My Cars',
      ),
      body: const Column(
        children: [
          Expanded(
            child: MyCarsListViewBuilder(),
          ),
        ],
      ),
    );
  }
}
