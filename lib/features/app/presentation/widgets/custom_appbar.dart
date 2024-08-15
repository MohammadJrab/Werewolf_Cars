import 'package:flutter/material.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';


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
            automaticallyImplyLeading: automaticallyImplyLeading));
  }
}
