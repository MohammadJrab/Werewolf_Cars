import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/generated/assets.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final bool automaticallyImplyLeading;

  const CustomAppbar(
      {super.key, required this.text, this.automaticallyImplyLeading = false});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: AppBar(
            backgroundColor: Colors.transparent,
            title: AppText(
              text,
              style: const TextStyle(color: AppColors.white),
            ),
            centerTitle: true,
            leading: automaticallyImplyLeading
                ? Padding(
                    padding: HWEdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () => GRouter.router.pop(),
                      child: SizedBox(
                        height: 24.h, // Change these values as needed
                        width: 24.w,
                        child: AppSvgPicture(
                          Assets.svgArrowLeft,
                          height: 24.h, // Match these to Container height/width
                          width: 24.w,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            automaticallyImplyLeading: automaticallyImplyLeading));
  }
}
