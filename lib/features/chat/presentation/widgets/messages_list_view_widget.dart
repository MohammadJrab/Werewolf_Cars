import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/chat/presentation/chat_page.dart';

import 'message_item_widget.dart';

class MessagesListViewWidget extends StatelessWidget {
  const MessagesListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: HWEdgeInsets.only(top: 10),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
       
        return MessageItemWidget(
          isCurrent: index % 2 == 0 ? true : false,
          isTimeShow: index % 4 == 0 ? true : false,
        );
      },
      separatorBuilder: (context, index) {
        return 10.horizontalSpace;
      },
      itemCount: 10,
    );
  }
}
