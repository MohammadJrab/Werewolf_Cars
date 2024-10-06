import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:werewolf_cars/common/enums/car_makers.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/animated_dialog.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';
import 'package:werewolf_cars/features/chat/presentation/widgets/white_divider.dart';
import 'package:werewolf_cars/features/my_car/presentation/manager/my_cars_bloc.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/car_add_image_item.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/car_add_image_item_empty_optional.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/colors_dialog.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/condition_dialog.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/cylinders_dialog.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/exterior_features_dialog.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/feature_grid_view_item.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/feature_section_widget.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/fuel_type_dialog.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/interior_features_dialog.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/makers_dialog.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/safety_features_dialog.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/seats_number_dialog.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/sell_car_item.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/sell_dialog_body.dart';
import 'package:collection/collection.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:werewolf_cars/core/config/theme/typography.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:werewolf_cars/core/utils/extensions/enum_translation.dart';
import 'package:werewolf_cars/core/utils/responsive_padding.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/app_text_field.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/transmission_dialof.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/vehicle_type_dialog.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/year_picker_dialog.dart';
import 'package:werewolf_cars/generated/locale_keys.g.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../../core/config/theme/colors_app.dart';
import '../../../../core/utils/debouncer.dart';
import '../../../../generated/assets.dart';
import '../../../app/presentation/widgets/app_cached_network_image.dart';
import '../../../app/presentation/widgets/app_loader_widget/app_loader.dart';
import '../../../app/presentation/widgets/app_svg_picture.dart';
part 'enter_car_details_page.dart';
part 'enter_car_features_page.dart';
part 'enter_car_price_and_description_page.dart';
part 'add_car_images_page.dart';

class SellMyCarPage extends StatefulWidget {
  const SellMyCarPage({super.key});

  @override
  State<SellMyCarPage> createState() => _SellMyCarPageState();
}

class _SellMyCarPageState extends State<SellMyCarPage> {
  late MyCarsBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I<MyCarsBloc>();
    super.initState();
  }

  @override
  void dispose() {
    bloc.add(ResetSellMyCarEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bloc.add(BackPageEvent());
        return false;
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(),
              const _PagedSellMyCar(),
              const _Button(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  _Header({super.key});

  final steps = [
    "Details",
    "Features",
    "Description",
    "Images",
  ];

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return Container(
      height: 115.h,
      margin: HWEdgeInsets.only(
          left: 10, right: 10, top: MediaQuery.of(context).padding.top + 5.h),
      padding: HWEdgeInsetsDirectional.only(start: 10, end: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => GetIt.I<MyCarsBloc>().add(BackPageEvent()),
                icon: const Icon(Icons.arrow_back_ios_rounded,
                    color: AppColors.white),
                padding: EdgeInsets.zero,
              ),
              62.horizontalSpace,
              AppText(
                "Sell My Car",
                style: context.textTheme.titleSmall.m!
                    .copyWith(color: AppColors.white, fontSize: 22.sp),
              )
            ],
          ),
          10.verticalSpace,
          BlocSelector<MyCarsBloc, MyCarsState, int>(
            selector: (state) => state.activeStep,
            builder: (context, activeStep) => Padding(
              padding: HWEdgeInsetsDirectional.only(top: 10),
              child: EasyStepper(
                activeStep: activeStep,
                internalPadding: 1,
                showLoadingAnimation: false,
                stepRadius: 5,
                showStepBorder: false,
                lineStyle: LineStyle(
                  lineLength: 90.w,
                  lineSpace: 0,
                  lineType: LineType.normal,
                  lineThickness: 3,
                  defaultLineColor: AppColors.grey,
                  activeLineColor: AppColors.grey,
                  finishedLineColor: activeStep < steps.length - 1
                      ? AppColors.orange
                      : AppColors.orange,
                ),
                stepShape: StepShape.circle,
                padding: EdgeInsets.zero,
                steps: steps
                    .mapIndexed<EasyStep>((index, title) => EasyStep(
                          customStep: AnimatedContainer(
                            duration: kTabScrollDuration,
                            width: 22.r,
                            height: 22.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2.r,
                                color: activeStep >= index &&
                                        activeStep != steps.length - 1
                                    ? AppColors.primary
                                    : AppColors.white,
                              ),
                              color: activeStep == index
                                  ? null
                                  : activeStep > index &&
                                          activeStep != steps.length - 1
                                      ? AppColors.primary
                                      : AppColors.white,
                            ),
                            child: activeStep > index
                                ? Icon(
                                    Icons.done_rounded,
                                    size: 14.r,
                                    color: activeStep == index
                                        ? null
                                        : activeStep >= steps.length - 1
                                            ? AppColors.primary
                                            : AppColors.white,
                                  )
                                : null,
                          ),
                          customTitle: Transform.translate(
                            offset: Offset(
                                index == 0
                                    ? (isRtl ? -20.r : 32.r)
                                    : index != steps.length - 1
                                        ? (isRtl ? -20.r : 20.r)
                                        : (isRtl ? -30.r : 30.r),
                                10.r),
                            child: AppText(
                              title,
                              style:
                                  context.textTheme.labelSmall.s13.m.withColor(
                                activeStep >= index &&
                                        activeStep != steps.length - 1
                                    ? AppColors.primary
                                    : AppColors.white,
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button();

  @override
  Widget build(BuildContext context) {
    final bloc = GetIt.I<MyCarsBloc>();
    return Padding(
      padding: HWEdgeInsetsDirectional.only(bottom: 24, start: 30, end: 30),
      child: BlocBuilder<MyCarsBloc, MyCarsState>(builder: (context, state) {
        final activeStep = state.activeStep;
        return AppElevatedButton(
          text: activeStep != 3 ? LocaleKeys.Continue : LocaleKeys.confirm,
          onPressed: () => bloc.add(NextPageEvent()),
          textStyle:
              context.textTheme.bodyMedium?.xb.s20.withColor(AppColors.black),
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              minimumSize: Size(MediaQuery.of(context).size.width, 50.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8).r)),
        );
      }),
    );
  }
}

class _PagedSellMyCar extends StatelessWidget {
  const _PagedSellMyCar();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: GetIt.I<MyCarsBloc>().pagedSellMyCarController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          _EnterCarDetailsPage(),
          _EnterCarFeaturesPage(),
          _EnterCarPriceAndDescriptionPage(),
          _AddCarImagesPage()
        ],
      ),
    );
  }
}































// class SellMyCarPage extends StatefulWidget {
//   const SellMyCarPage({super.key});

//   @override
//   State<SellMyCarPage> createState() => _SellMyCarPageState();
// }

// class _SellMyCarPageState extends State<SellMyCarPage> {
//   int _currentStep = 0;
//   final ScrollController _scrollController = ScrollController();

//   final List<Widget> _sellItemSections = const [
//     SellItemSectionOne(),
//     SellItemSectionTwo(),
//     SellItemSectionThree(),
//     SellItemSectionFour(),
//     SellItemSectionFive(),
//   ];

//   final List<double> _progressValues = [.2, .4, .6, .8, 1];

//   void _onNext() {
//     if (_currentStep < _sellItemSections.length - 1) {
//       setState(() {
//         _currentStep++;
//       });

//       // Scroll back to the top of the screen
//       _scrollController.animateTo(
//         0.0,
//         duration: const Duration(milliseconds: 500),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       onPopInvoked: (s) {
//         if (_currentStep == 0) {
//           AnimatedDialog.show(context,
//               barrierDismissible: true,
//               barrierLabel: "ExitDialog",
//               child: const SellDialogBody());
//         } else {
//           _currentStep--;
//         }
//       },
//       canPop: false,
//       child: Scaffold(
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         floatingActionButton: NextButton(
//           text: _currentStep == 4 ? 'Submit' : 'Next',
//           onTap: _currentStep >= 4
//               ? () => GRouter.router.pushReplacementNamed(
//                   GRouter.config.myCarsRoutes.congratulationsPage)
//               : _onNext,
//         ),
//         appBar: const CustomAppbar(
//           text: 'Sell My Car',
//           automaticallyImplyLeading: true,
//         ),
//         body: Column(
//           children: [
//             ProgressLine(value: _progressValues[_currentStep]),
//             10.verticalSpace,
//             Expanded(
//               child: SingleChildScrollView(
//                 controller: _scrollController,
//                 child: Column(children: [
//                   _sellItemSections[_currentStep],
//                 ]),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
