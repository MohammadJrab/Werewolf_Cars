import 'package:flutter/material.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';
import 'package:werewolf_cars/generated/locale_keys.g.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackLight,
      appBar: const CustomAppbar(text: LocaleKeys.settingsApp_privacyPolicy),
      body: Padding(
        padding: HWEdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: AppText(
          LocaleKeys.settingsApp_privacyPolicy,
          style: context.textTheme.bodyLarge?.xb.s17.withColor(AppColors.white),
        ),
      ),
    );
  }
}
