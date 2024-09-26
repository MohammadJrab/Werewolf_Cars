import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/generated/assets.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatTextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isEmojiPickerVisible;
  final VoidCallback onToggleEmojiPicker;

  const ChatTextFieldInput({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.isEmojiPickerVisible,
    required this.onToggleEmojiPicker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: null,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: GestureDetector(
          onTap: onToggleEmojiPicker,
          child: Padding(
            padding: HWEdgeInsets.only(left: 18.0, right: 12.0),
            child: isEmojiPickerVisible
                ? Icon(
                    CupertinoIcons.keyboard,
                    size: 27.r,
                  )
                : AppSvgPicture(
                    Assets.svgSmile,
                    width: 27.w,
                  ),
          ),
        ),
        constraints: BoxConstraints(minHeight: 50.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.grey, width: 1.5.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.grey, width: 1.5.r),
        ),
        contentPadding:
            HWEdgeInsets.only(right: 8, left: 15, top: 12, bottom: 12),
        hintText: 'Your message...',
        hintStyle:
            context.textTheme.titleMedium?.m.withColor(const Color(0xff6E7079)),
        hoverColor: AppColors.white,
      ),
    );
  }
}
