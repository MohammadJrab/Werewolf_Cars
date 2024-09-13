import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';
import 'package:werewolf_cars/generated/assets.dart';

class CarDetalisAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CarDetalisAppbar({
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  PreferredSizeWidget build(BuildContext context) {
    return CustomAppbar(
      text: 'Car Details',
      automaticallyImplyLeading: true,
      action: Padding(
        padding: const EdgeInsets.only(right: 20),
        // ToDo :  Heart must be empty not solid
        child: AppSvgPicture(
          Assets.svgHeart,
          height: 24.h,
          width: 24.w,
        ),
      ),
    );
  }
}
