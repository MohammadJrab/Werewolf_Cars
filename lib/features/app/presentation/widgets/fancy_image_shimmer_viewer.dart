import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';

class FancyImageShimmerViewer extends StatelessWidget {
  const FancyImageShimmerViewer({
    Key? key,
    required this.imageUrl,
    this.errorWidget,
    this.width,
    this.height,
    this.fit = BoxFit.fill,
  }) : super(key: key);

  final String imageUrl;
  final Widget? errorWidget;
  final BoxFit fit;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return FancyShimmerImage(
      imageUrl: imageUrl,
      errorWidget: errorWidget ??
          Center(child: Icon(Icons.error, color: context.colorScheme.error)),
      boxFit: fit,
      height: height ?? 300,
      width: width ?? 300,
    );
  }
}
