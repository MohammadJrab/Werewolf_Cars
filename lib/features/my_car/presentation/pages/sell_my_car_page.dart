import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/config/routing/router.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/animated_dialog.dart';
import 'package:werewolf_cars/features/app/presentation/widgets/custom_appbar.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/next_button.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/progress_line.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/sell_dialog_body.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/sell_item_section_five.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/sell_item_section_four.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/sell_item_section_one.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/sell_item_section_three.dart';
import 'package:werewolf_cars/features/my_car/presentation/widgets/sell_item_section_two.dart';

class SellMyCarPage extends StatefulWidget {
  const SellMyCarPage({super.key});

  @override
  State<SellMyCarPage> createState() => _SellMyCarPageState();
}

class _SellMyCarPageState extends State<SellMyCarPage> {
  int _currentStep = 0;
  final ScrollController _scrollController = ScrollController();

  final List<Widget> _sellItemSections = const [
    SellItemSectionOne(),
    SellItemSectionTwo(),
    SellItemSectionThree(),
    SellItemSectionFour(),
    SellItemSectionFive(),
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
              NextButton(
                text: _currentStep == 4 ? 'Submit' : 'Next',
                onTap: _currentStep >= 4
                    ? () => GRouter.router.pushReplacementNamed(
                        GRouter.config.myCarsRoutes.congratulationsPage)
                    : _onNext,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
