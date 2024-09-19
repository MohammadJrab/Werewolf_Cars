import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    super.key,
    required this.value,
  });
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: value.sw,
            child: const CustomDivider(color: AppColors.orange)),
        SizedBox(width: (1 - value).sw, child: const CustomDivider()),
      ],
    );
  }
}
