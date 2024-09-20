import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/chat_text_field_input.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/emoji_picker_widget.dart';
import 'send_button.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({super.key});

  @override
  ChatTextFieldState createState() => ChatTextFieldState();
}

class ChatTextFieldState extends State<ChatTextField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isEmojiPickerVisible = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus) {
      setState(() {
        _isEmojiPickerVisible = false;
      });
    }
  }

  void _toggleEmojiPicker() {
    setState(() {
      _isEmojiPickerVisible = !_isEmojiPickerVisible;
      if (_isEmojiPickerVisible) {
        _focusNode.unfocus();
      } else {
        _focusNode.requestFocus();
      }
    });
  }

  Future<bool> _onWillPop() async {
    if (_isEmojiPickerVisible) {
      setState(() {
        _isEmojiPickerVisible = false;
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Column(
        children: [
          Padding(
            padding: HWEdgeInsets.only(left: 12, right: 12, top: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ChatTextFieldInput(
                    controller: _controller,
                    focusNode: _focusNode,
                    isEmojiPickerVisible: _isEmojiPickerVisible,
                    onToggleEmojiPicker: _toggleEmojiPicker,
                  ),
                ),
                8.horizontalSpace,
                const SendButton(),
              ],
            ),
          ),
          EmojiPickerWidget(
            controller: _controller,
            isEmojiPickerVisible: _isEmojiPickerVisible,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }
}
