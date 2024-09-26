import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/home/presentation/widgets/maker_list_view_home.dart';

class MakersFilterHomeSection extends StatelessWidget {
  const MakersFilterHomeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: HWEdgeInsetsDirectional.only(start: 24, top: 20, bottom: 20),
          child: AppText(
            "Browse by Makers",
            style: context.textTheme.bodyMedium.s20.sb,
          ),
        ),
        SizedBox(
          width: 1.sw,
          height: 60.h,
          child: const MakersListViewHome(),
        ),
      ],
    );
  }
}
