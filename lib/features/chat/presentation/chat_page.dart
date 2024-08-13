import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/generated/assets.dart';

import 'widgets/chat_text_field.dart';
import 'widgets/circlue_user_image_widget.dart';
import 'widgets/messages_list_view_widget.dart';
import 'widgets/user_name.dart';
import 'widgets/white_divider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackLight,
      body: SafeArea(
        child: Padding(
          padding: HWEdgeInsets.only(left: 18, right: 18, top: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    const CirclueUserImageWidget(),
                    15.horizontalSpace,
                    const UserName(),
                  ],
                ),
              ),
              12.verticalSpace,
              const WhiteDivider(),
              const Expanded(
                child: MessagesListViewWidget(),
              ),
              const ChatTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
