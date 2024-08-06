import 'package:flutter/material.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import '../widgets/app_text.dart';

class ErrorPage extends StatelessWidget {
  final Exception? exception;

  const ErrorPage({Key? key, this.exception}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText(
        exception.toString(),
        style: context.textTheme.bodyLarge!.m.withColor(AppColors.orange),
      ),
    );
  }
}
