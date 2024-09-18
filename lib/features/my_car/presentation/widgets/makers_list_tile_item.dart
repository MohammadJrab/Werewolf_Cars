import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';

class MakerListTileItem extends StatelessWidget {
  const MakerListTileItem({
    super.key,
    required this.context,
    required this.name,
  });

  final BuildContext context;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 42.h,
      title: AppText(
        name,
        style: context.textTheme.titleMedium?.r,
      ),
    );
  }
}
