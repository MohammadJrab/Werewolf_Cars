import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'edited_spinkit_three_bounce.dart';

part 'spinkit_circle.dart';

part 'spinkit_three_bounce.dart';

part 'spinkit_three_bounce_editing.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({
    super.key,
    this.size,
    this.color,
  });

  final double? size;
  final Color? color;

  const factory AppLoader.spinKitThreeBounce({Key? key}) = _SpinKitThreeBounce;

  const factory AppLoader.spinKitThreeBounceEditing({Key? key}) =
      _SpinKitThreeBounceEditing;

  const factory AppLoader.spinKitCircle({Key? key}) = _SpinKitCircle;

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.threeArchedCircle(
      size: size ?? 30.r,
      color: color ?? context.colorScheme.primary,
    );
  }
}
