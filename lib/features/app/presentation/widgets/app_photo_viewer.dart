import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:werewolf_cars/core/utils/extensions/build_context.dart';
import 'package:photo_view/photo_view.dart';
import '../../../../core/utils/responsive_padding.dart';
import 'app_scaffold.dart';

enum ImageSource {
  network,
  asset,
}

class AppPhotoViewer extends StatelessWidget {
  const AppPhotoViewer({
    Key? key,
    required this.urls,
    this.imageSource = ImageSource.network,
    this.loadingBuilder,
    this.backgroundDecoration,
    this.wantKeepAlive = false,
    this.gaplessPlayback = false,
    this.heroAttributes,
    this.scaleStateChangedCallback,
    this.enableRotation = false,
    this.maxScale,
    this.minScale,
    this.initialScale,
    this.basePosition,
    this.scaleStateCycle,
    this.onTapUp,
    this.onTapDown,
    this.onScaleEnd,
    this.customSize,
    this.gestureDetectorBehavior,
    this.tightMode,
    this.filterQuality,
    this.disableGestures,
    this.errorBuilder,
    this.enablePanAlways,
  }) : super(key: key);

  show(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AppPhotoViewer(urls: urls)),
    );
  }

  final ImageSource imageSource;

  final List<String> urls;

  /// While [imageProvider] is not resolved, [loadingBuilder] is called by [PhotoView]
  /// into the screen, by default it is a centered [CircularProgressIndicator]
  final LoadingBuilder? loadingBuilder;

  /// Show loadFailedChild when the image failed to load
  final ImageErrorWidgetBuilder? errorBuilder;

  /// Changes the background behind image, defaults to `Colors.black`.
  final BoxDecoration? backgroundDecoration;

  /// This is used to keep the state of an image in the gallery (e.g. scale state).
  /// `false` -> resets the state (default)
  /// `true`  -> keeps the state
  final bool wantKeepAlive;

  /// This is used to continue showing the old image (`true`), or briefly show
  /// nothing (`false`), when the `imageProvider` changes. By default it's set
  /// to `false`.
  final bool gaplessPlayback;

  /// Attributes that are going to be passed to [PhotoViewCore]'s
  /// [Hero]. Leave this property undefined if you don't want a hero animation.
  final PhotoViewHeroAttributes? heroAttributes;

  /// Defines the size of the scaling base of the image inside [PhotoView],
  /// by default it is `MediaQuery.of(context).size`.
  final Size? customSize;

  /// A [Function] to be called whenever the scaleState changes, this happens when the user double taps the content ou start to pinch-in.
  final ValueChanged<PhotoViewScaleState>? scaleStateChangedCallback;

  /// A flag that enables the rotation gesture support
  final bool enableRotation;

  /// Defines the maximum size in which the image will be allowed to assume, it
  /// is proportional to the original image size. Can be either a double (absolute value) or a
  /// [PhotoViewComputedScale], that can be multiplied by a double
  final dynamic maxScale;

  /// Defines the minimum size in which the image will be allowed to assume, it
  /// is proportional to the original image size. Can be either a double (absolute value) or a
  /// [PhotoViewComputedScale], that can be multiplied by a double
  final dynamic minScale;

  /// Defines the initial size in which the image will be assume in the mounting of the component, it
  /// is proportional to the original image size. Can be either a double (absolute value) or a
  /// [PhotoViewComputedScale], that can be multiplied by a double
  final dynamic initialScale;

  /// The alignment of the scale origin in relation to the widget size. Default is [Alignment.center]
  final Alignment? basePosition;

  /// Defines de next [PhotoViewScaleState] given the actual one. Default is [defaultScaleStateCycle]
  final ScaleStateCycle? scaleStateCycle;

  /// A pointer that will trigger a tap has stopped contacting the screen at a
  /// particular location.
  final PhotoViewImageTapUpCallback? onTapUp;

  /// A pointer that might cause a tap has contacted the screen at a particular
  /// location.
  final PhotoViewImageTapDownCallback? onTapDown;

  /// A pointer that will trigger a scale has stopped contacting the screen at a
  /// particular location.
  final PhotoViewImageScaleEndCallback? onScaleEnd;

  /// [HitTestBehavior] to be passed to the internal gesture detector.
  final HitTestBehavior? gestureDetectorBehavior;

  /// Enables tight mode, making background container assume the size of the image/child.
  /// Useful when inside a [Dialog]
  final bool? tightMode;

  /// Quality levels for image filters.
  final FilterQuality? filterQuality;

  // Removes gesture detector if `true`.
  // Useful when custom gesture detector is used in child widget.
  final bool? disableGestures;

  /// Enable pan the widget even if it's smaller than the hole parent widget.
  /// Useful when you want to drag a widget without restrictions.
  final bool? enablePanAlways;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: urls.length,
            itemBuilder: (context, index) => PhotoView(
              imageProvider: imageSource == ImageSource.network
                  ? CachedNetworkImageProvider(urls[index]) as ImageProvider
                  : AssetImage(urls[index]),
              loadingBuilder: loadingBuilder,
              backgroundDecoration: backgroundDecoration,
              wantKeepAlive: wantKeepAlive,
              gaplessPlayback: gaplessPlayback,
              heroAttributes: heroAttributes,
              scaleStateChangedCallback: scaleStateChangedCallback,
              enableRotation: enableRotation,
              maxScale: maxScale,
              minScale: minScale,
              initialScale: initialScale,
              basePosition: basePosition,
              scaleStateCycle: scaleStateCycle,
              onTapUp: onTapUp,
              onTapDown: onTapDown,
              onScaleEnd: onScaleEnd,
              customSize: customSize,
              gestureDetectorBehavior: gestureDetectorBehavior,
              tightMode: tightMode,
              filterQuality: filterQuality,
              disableGestures: disableGestures,
              errorBuilder: errorBuilder,
              enablePanAlways: enablePanAlways,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Container(
              height: 40.r,
              width: 40.r,
              margin: HWEdgeInsetsDirectional.only(start: 24, top: 60),
              decoration: BoxDecoration(
                  color: context.colorScheme.background,
                  shape: BoxShape.circle),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: context.colorScheme.onBackground,
                    size: 20.sp,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
