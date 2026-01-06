// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Frame.png
  AssetGenImage get frame => const AssetGenImage('assets/images/Frame.png');

  /// File path: assets/images/Home.png
  AssetGenImage get home => const AssetGenImage('assets/images/Home.png');

  /// File path: assets/images/back.png
  AssetGenImage get back => const AssetGenImage('assets/images/back.png');

  /// File path: assets/images/bath tub.png
  AssetGenImage get bathTub =>
      const AssetGenImage('assets/images/bath tub.png');

  /// File path: assets/images/cart1.png
  AssetGenImage get cart1 => const AssetGenImage('assets/images/cart1.png');

  /// File path: assets/images/cart2.png
  AssetGenImage get cart2 => const AssetGenImage('assets/images/cart2.png');

  /// File path: assets/images/detail.png
  AssetGenImage get detail => const AssetGenImage('assets/images/detail.png');

  /// File path: assets/images/food.png
  AssetGenImage get food => const AssetGenImage('assets/images/food.png');

  /// File path: assets/images/home1.png
  AssetGenImage get home1 => const AssetGenImage('assets/images/home1.png');

  /// File path: assets/images/home2.png
  AssetGenImage get home2 => const AssetGenImage('assets/images/home2.png');

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// File path: assets/images/star.png
  AssetGenImage get star => const AssetGenImage('assets/images/star.png');

  /// File path: assets/images/wifi.png
  AssetGenImage get wifi => const AssetGenImage('assets/images/wifi.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    frame,
    home,
    back,
    bathTub,
    cart1,
    cart2,
    detail,
    food,
    home1,
    home2,
    splash,
    star,
    wifi,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
