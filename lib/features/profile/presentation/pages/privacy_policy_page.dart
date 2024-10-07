import 'package:flutter/material.dart';
import 'package:werewolf_cars/common/constants/constants.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';
import 'package:werewolf_cars/generated/locale_keys.g.dart';
import 'package:flutter_html/flutter_html.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        text: LocaleKeys.settingsApp_privacyPolicy,
        automaticallyImplyLeading: true,
      ),
      backgroundColor: AppColors.blackLight,
      body: Padding(
        padding: HWEdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            Html(data: privacyPolicyHTML),
          ],
        ),
      ),
    );
  }
}
