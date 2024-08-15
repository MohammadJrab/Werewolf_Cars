import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackLight,
      appBar: const CustomAppbar(
        text: 'Notifications',
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            20.verticalSpace,
            const NotificationItemWidget(),
            const NotificationItemWidget(),
            const NotificationItemWidget(),
            const NotificationItemWidget(),
            const NotificationItemWidget(),
            const NotificationItemWidget(),
            const NotificationItemWidget(),
            const NotificationItemWidget(),
            const NotificationItemWidget(),
          ],
        ),
      ),
    );
  }
}

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: HWEdgeInsets.all(20),
      margin: HWEdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: context.mediaQuery.size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.white,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'data',
            style:
                context.textTheme.bodyLarge?.b.s15.withColor(AppColors.white),
          ),
          AppText(
            'data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data ',
            style: context.textTheme.bodyLarge?.s14.withColor(AppColors.white),
          ),
        ],
      ),
    );
  }
}
