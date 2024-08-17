import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/circlue_user_image_widget.dart';
import 'package:werewolf_cars/generated/assets.dart';

import '../widgets/edit_column_items_profile.dart';
import '../widgets/save_button_profile.dart';
import '../widgets/user_image_with_edit.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackLight,
      appBar: const CustomAppbar(
        text: 'Edit Profile',
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: HWEdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              40.verticalSpace,
              const UserImageWithEdit(),
              60.verticalSpace,
              const EditColumnItemsProfile(),
              const Spacer(),
              const SaveButtonProfile(),
            ],
          ),
        ),
      ),
    );
  }
}
