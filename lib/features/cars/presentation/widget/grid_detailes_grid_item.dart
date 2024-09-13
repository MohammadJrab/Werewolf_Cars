import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';

class GridDetailesGridItem extends StatelessWidget {
  const GridDetailesGridItem({
    super.key,
    required this.title,
    required this.path,
  });
  final String title, path;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSvgPicture(
          path,
          height: 30.h,
          width: 30.w,
        ),
        7.verticalSpace,
        AppText(
          title,
          style: context.textTheme.bodyLarge!.s13.r.withColor(AppColors.white),
        ),
      ],
    );
  }
}
