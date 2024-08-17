import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';

class CustomSliderWidget extends StatefulWidget {
  const CustomSliderWidget({
    super.key,
  });

  @override
  State<CustomSliderWidget> createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  RangeValues _currentRangeValues = const RangeValues(30000, 2000000);

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive sizing
    ScreenUtil.init(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            // The RangeSlider
            RangeSlider(
              values: _currentRangeValues,
              min: 0,
              max: 2000000,
              divisions: (2000000 / 500).round(), // Ensure increments of 500
              activeColor: AppColors.primary,
              inactiveColor: AppColors.white,
              onChanged: (RangeValues values) {
                setState(() {
                  // Round the values to the nearest multiple of 500
                  double start = (values.start / 500).round() * 500;
                  double end = (values.end / 500).round() * 500;

                  _currentRangeValues = RangeValues(start, end);
                });
              },
            ),
            SizedBox(
                height:
                    20.h), // Space for the text under the slider, responsive
          ],
        ),
        // Positioned text for the start value
        Positioned(
          left: _calculatePosition(_currentRangeValues.start),
          bottom: 0,
          child: AppText(
            _currentRangeValues.start.toStringAsFixed(0),
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 14.sp, // Responsive font size
            ),
            maxLines: 1,
          ),
        ),
        // Positioned text for the end value
        Positioned(
          left: _calculatePositionEnd(_currentRangeValues.end),
          bottom: 0,
          child: AppText(
            _currentRangeValues.end.toStringAsFixed(0),
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 14.sp, // Responsive font size
            ),
            maxLines: 1,
          ),
        ),
      ],
    );
  }

  // Function to calculate the position of the text based on the slider value
  double _calculatePosition(double value) {
    double sliderWidth =
        MediaQuery.of(context).size.width - 48.w; // Responsive padding
    double relativeValue = value / 2000000; // Normalize the value
    return 24.w +
        (relativeValue * sliderWidth) -
        20.w; // Adjusted for responsive design
  }

  double _calculatePositionEnd(double value) {
    double sliderWidth =
        MediaQuery.of(context).size.width - 48.w; // Responsive padding
    double relativeValue = value / 2000000; // Normalize the value
    return 24.w +
        (relativeValue * sliderWidth) -
        100.w; // Adjusted for responsive design
  }
}
