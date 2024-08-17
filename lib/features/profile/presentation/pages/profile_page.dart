import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';

import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';

import 'package:werewolf_cars/generated/locale_keys.g.dart';

import '../widgets/settings_section_profile.dart';
import '../widgets/top_section_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackLight,
      appBar: const CustomAppbar(
        text: LocaleKeys.profile,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: HWEdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const TopSectionProfilePage(),
                30.verticalSpace,
                const SettingsSectionProfile()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
