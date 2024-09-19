import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/circlar_check_icon.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/exit_button.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/next_button.dart';



class CongratulationsPage extends StatelessWidget {
  const CongratulationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ExitButton(),
          100.verticalSpace,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CirclarCheckIcon(),
              20.verticalSpace,
              SizedBox(
                width: 260.w,
                child: AppText(
                  'Your request is submitted successfully',
                  style: context.textTheme.bodyMedium?.b.s20
                      .withColor(AppColors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              20.verticalSpace,
              SizedBox(
                width: 260.w,
                child: AppText(
                  'We will contact you after reviewing the request.',
                  style: context.textTheme.bodyMedium?.b.s14
                      .withColor(AppColors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              80.verticalSpace,
              NextButton(
                text: 'Go to dashboard',
                onTap: () => GRouter.router.pop(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
