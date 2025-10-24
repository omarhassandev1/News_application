// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsMainLayerGen {
  const $AssetsMainLayerGen();

  /// Directory path: assets/main_layer/categories_card
  $AssetsMainLayerCategoriesCardGen get categoriesCard =>
      const $AssetsMainLayerCategoriesCardGen();
}

class $AssetsMainLayerCategoriesCardGen {
  const $AssetsMainLayerCategoriesCardGen();

  /// File path: assets/main_layer/categories_card/business.png
  AssetGenImage get business =>
      const AssetGenImage('assets/main_layer/categories_card/business.png');

  /// File path: assets/main_layer/categories_card/entertainment.png
  AssetGenImage get entertainment => const AssetGenImage(
    'assets/main_layer/categories_card/entertainment.png',
  );

  /// File path: assets/main_layer/categories_card/general.png
  AssetGenImage get general =>
      const AssetGenImage('assets/main_layer/categories_card/general.png');

  /// File path: assets/main_layer/categories_card/health.png
  AssetGenImage get health =>
      const AssetGenImage('assets/main_layer/categories_card/health.png');

  /// File path: assets/main_layer/categories_card/science.png
  AssetGenImage get science =>
      const AssetGenImage('assets/main_layer/categories_card/science.png');

  /// File path: assets/main_layer/categories_card/sports.png
  AssetGenImage get sports =>
      const AssetGenImage('assets/main_layer/categories_card/sports.png');

  /// File path: assets/main_layer/categories_card/technology.png
  AssetGenImage get technology =>
      const AssetGenImage('assets/main_layer/categories_card/technology.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    business,
    entertainment,
    general,
    health,
    science,
    sports,
    technology,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsMainLayerGen mainLayer = $AssetsMainLayerGen();
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
