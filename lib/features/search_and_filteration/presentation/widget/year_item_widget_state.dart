import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/year_picker_dialog.dart';
import 'package:werewolf_cars/features/search_and_filteration/presentation/pages/filter_page.dart';

class YearItemWidget extends StatefulWidget {
  const YearItemWidget({
    super.key,
  });

  @override
  State<YearItemWidget> createState() => _YearItemWidgetState();
}

class _YearItemWidgetState extends State<YearItemWidget> {
  late int selectedYear;

  @override
  void initState() {
    super.initState();
    selectedYear = 1990;
  }

  void onYearChanged(int newYear) {
    setState(() {
      selectedYear = newYear;
    });
  }

  void _pickYear() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return YearPickerDialog(
          currentYear: selectedYear,
          onYearChanged: (newYear) {
            onYearChanged(newYear);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickYear,
      child: Container(
        alignment: Alignment.center,
        height: 45.h,
        width: 130.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        child: AppText(
          '$selectedYear',
          style: context.textTheme.bodyLarge?.s14.withColor(AppColors.white),
        ),
      ),
    );
  }
}
