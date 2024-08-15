import 'package:flutter/material.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_bottom_sheet.dart';
import 'package:werewolf_cars/features/profile/presentation/pages/profile_page.dart';
import 'package:werewolf_cars/features/profile/presentation/widgets/logout_bottom_sheet.dart';
import 'package:werewolf_cars/generated/assets.dart';

import 'profile_item_settings_widget.dart';

class SettingsSectionProfile extends StatelessWidget {
  const SettingsSectionProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const ProfileItemSettingsWidget(
          title: 'Edit Profile',
          svgIcon: Assets.svgPerson,
        ),
        const ProfileItemSettingsWidget(
          title: 'Address',
          svgIcon: Assets.svgMapPin,
        ),
        const ProfileItemSettingsWidget(
          title: 'My Cars',
          svgIcon: Assets.svgCarDealer,
        ),
        const ProfileItemSettingsWidget(
          title: 'Notfications',
          svgIcon: Assets.svgBell,
        ),
        const ProfileItemSettingsWidget(
          title: 'Language',
          // TODO : add language svg correct
          svgIcon: Assets.svgYear,
        ),
        const ProfileItemSettingsWidget(
          title: 'Privacy Policy',
          svgIcon: Assets.svgLock,
        ),
        const ProfileItemSettingsWidget(
          title: 'About Us',
          svgIcon: Assets.svgInfoRect,
        ),
        ProfileItemSettingsWidget(
          title: 'Logout',
          svgIcon: Assets.svgLogout,
          isLastItem: false,
          color: AppColors.primary,
          onTap: () {
            LogoutBottomSheet.showBasicModalBottomSheet(context);
          },
        ),
      ],
    );
  }
}
