import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/cars/presentation/widget/contect_button.dart';
import 'package:werewolf_cars/features/cars/presentation/widget/user_section_with_location.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';
import 'package:werewolf_cars/generated/assets.dart';

class SellerSctionDetalis extends StatelessWidget {
  const SellerSctionDetalis({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'Seller',
            style: context.textTheme.bodyLarge!.s17.b.withColor(AppColors.grey),
          ),
          20.verticalSpace,
          const UserSectionWithLocation(),
          30.verticalSpace,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContectButton(svg: Assets.svgPhone, title: 'Call'),
              ContectButton(svg: Assets.svgNavChat, title: 'Chat'),
              ContectButton(svg: Assets.svgEmail, title: 'Email'),
            ],
          ),
          15.verticalSpace,
          const ContectButton(
              svg: Assets.svgEmail, title: 'Send Message to Mohammad'),
          30.verticalSpace,
          const WhiteDivider(color: AppColors.whiteLess, thickness: 2),
          10.verticalSpace,
        ],
      ),
    );
  }
}
