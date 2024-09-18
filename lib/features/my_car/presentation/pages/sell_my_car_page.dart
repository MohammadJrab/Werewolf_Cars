import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/core/config/theme/colors_app.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/animated_dialog.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_svg_picture.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text_button.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/my_cars_list_view_builder.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/sell_dialog_body.dart';
import 'package:werewolf_cars/generated/assets.dart';
import 'package:werewolf_cars/generated/locale_keys.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SellMyCarPage extends StatefulWidget {
  const SellMyCarPage({super.key});

  @override
  State<SellMyCarPage> createState() => _SellMyCarPageState();
}

class _SellMyCarPageState extends State<SellMyCarPage> {
  int _currentStep = 0;
  final ScrollController _scrollController = ScrollController();

  final List<Widget> _sellItemSections = const [
    SellItemSectionFour(),
    SellItemSection(),
    SellItemSection(),
    SellItemSection(),
    SellItemSection(),
  ];

  final List<double> _progressValues = [.2, .4, .6, .8, 1];

  void _onNext() {
    if (_currentStep < _sellItemSections.length - 1) {
      setState(() {
        _currentStep++;
      });

      // Scroll back to the top of the screen
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        AnimatedDialog.show(context,
            barrierDismissible: true,
            barrierLabel: "ExitDialog",
            child: const SellDialogBody());
      },
      canPop: false,
      child: Scaffold(
        appBar: const CustomAppbar(
          text: 'Sell My Car',
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          controller: _scrollController, // Attach the ScrollController here
          child: Column(
            children: [
              ProgressLine(value: _progressValues[_currentStep]),
              10.verticalSpace,
              _sellItemSections[_currentStep],
              NextButton(onTap: _onNext),
            ],
          ),
        ),
      ),
    );
  }
}

class CongratulationsSection extends StatelessWidget {
  const CongratulationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => GRouter.router.pop(),
          child: const Icon(CupertinoIcons.xmark),
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadiusDirectional.circular(8)),
        height: 50.h,
        margin: HWEdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
        padding: HWEdgeInsets.symmetric(vertical: 10.h),
        alignment: Alignment.center,
        child: AppText(
          'Next',
          style:
              context.textTheme.bodyMedium?.xb.s20.withColor(AppColors.black),
        ),
      ),
    );
  }
}

class SellItemSection extends StatelessWidget {
  const SellItemSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SellCarItem(),
        SellCarItem(),
        SellCarItem(),
        SellCarItem(),
        SellCarItem(),
        SellCarItem(),
        SellCarItem(),
      ],
    );
  }
}

class SellItemSectionFour extends StatelessWidget {
  const SellItemSectionFour({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: HWEdgeInsets.only(top: (12.5).h, left: 10.w, right: 10.w),
          padding: HWEdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    'Safety',
                    style: context.textTheme.bodyMedium?.r.s18
                        .withColor(AppColors.grey),
                  ),
                  AppText(
                    'Add / Edit',
                    style: context.textTheme.bodyMedium?.r.s13
                        .withColor(AppColors.grey),
                  ),
                ],
              ),
              10.verticalSpace,
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppSvgPicture(Assets.svgCheckCircle),
                            5.horizontalSpace,
                            SizedBox(
                              width: 125.w,
                              child: AppText(
                                'Adaptive cruise control',
                                style: context.textTheme.bodyMedium?.r.s15
                                    .withColor(AppColors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      30.horizontalSpace,
                      SizedBox(
                        width: 150.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppSvgPicture(Assets.svgCheckCircle),
                            5.horizontalSpace,
                            SizedBox(
                              width: 125.w,
                              child: AppText(
                                'Adaptive cruise control',
                                style: context.textTheme.bodyMedium?.r.s15
                                    .withColor(AppColors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  Row(
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppSvgPicture(Assets.svgCheckCircle),
                            5.horizontalSpace,
                            SizedBox(
                              width: 125.w,
                              child: AppText(
                                'Adaptive cruise control',
                                style: context.textTheme.bodyMedium?.r.s15
                                    .withColor(AppColors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      30.horizontalSpace,
                      SizedBox(
                        width: 150.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppSvgPicture(Assets.svgCheckCircle),
                            5.horizontalSpace,
                            SizedBox(
                              width: 125.w,
                              child: AppText(
                                'Adaptive cruise control',
                                style: context.textTheme.bodyMedium?.r.s15
                                    .withColor(AppColors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    'Exterior',
                    style: context.textTheme.bodyMedium?.r.s18
                        .withColor(AppColors.grey),
                  ),
                  AppText(
                    'Add / Edit',
                    style: context.textTheme.bodyMedium?.r.s13
                        .withColor(AppColors.grey),
                  ),
                ],
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    'Interior',
                    style: context.textTheme.bodyMedium?.r.s18
                        .withColor(AppColors.grey),
                  ),
                  AppText(
                    'Add / Edit',
                    style: context.textTheme.bodyMedium?.r.s13
                        .withColor(AppColors.grey),
                  ),
                ],
              ),
              20.verticalSpace,
              AppText(
                'Description',
                style: context.textTheme.bodyMedium?.r.s18
                    .withColor(AppColors.grey),
              ),
              20.verticalSpace,
              AppText(
                "This BMW M4 Competition features a powerful twin-turbocharged engine, a sleek carbon-fiber roof, and high-end performance features. It’s a perfect balance of luxury and speed, with low mileage and excellent condition.",
                style: context.textTheme.bodyMedium?.r.s15
                    .withColor(AppColors.white),
              ),
              30.verticalSpace,
              const CustomDivider(
                thickness: .5,
              ),
              30.verticalSpace,
              AppText(
                'Price',
                style: context.textTheme.bodyMedium?.r.s18
                    .withColor(AppColors.grey),
              ),
              8.verticalSpace,
              AppText(
                r'25,000 $',
                style: context.textTheme.bodyMedium?.b.s20
                    .withColor(AppColors.white),
              ),
              40.verticalSpace,
            ],
          ),
        ),
      ],
    );
  }
}

class SellCarItem extends StatelessWidget {
  const SellCarItem({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: HWEdgeInsets.only(top: (12.5).h, left: 10.w, right: 10.w),
        padding: HWEdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              'Make',
              style:
                  context.textTheme.bodyMedium?.r.s18.withColor(AppColors.grey),
            ),
            10.verticalSpace,
            AppText(
              'BMW',
              style: context.textTheme.bodyMedium?.b.s20
                  .withColor(AppColors.white),
            ),
            5.verticalSpace,
            const CustomDivider(
              thickness: .5,
            ),
          ],
        ),
      ),
    );
  }
}

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
