// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsAudioGen {
  const $AssetsAudioGen();

  /// File path: assets/audio/forest.mp3
  String get forest => 'assets/audio/forest.mp3';

  /// File path: assets/audio/piano.mp3
  String get piano => 'assets/audio/piano.mp3';

  /// List of all assets
  List<String> get values => [forest, piano];
}

class $AssetsColorsGen {
  const $AssetsColorsGen();

  /// File path: assets/colors/colors.xml
  String get colors => 'assets/colors/colors.xml';

  /// List of all assets
  List<String> get values => [colors];
}

class $AssetsDataGen {
  const $AssetsDataGen();

  /// File path: assets/data/ambience_data.json
  String get ambienceData => 'assets/data/ambience_data.json';

  /// List of all assets
  List<String> get values => [ambienceData];
}

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/forest.webp
  AssetGenImage get forest => const AssetGenImage('assets/png/forest.webp');

  /// File path: assets/png/lake.webp
  AssetGenImage get lake => const AssetGenImage('assets/png/lake.webp');

  /// File path: assets/png/misty.webp
  AssetGenImage get misty => const AssetGenImage('assets/png/misty.webp');

  /// File path: assets/png/mountain.webp
  AssetGenImage get mountain => const AssetGenImage('assets/png/mountain.webp');

  /// File path: assets/png/waves.webp
  AssetGenImage get waves => const AssetGenImage('assets/png/waves.webp');

  /// File path: assets/png/zen.webp
  AssetGenImage get zen => const AssetGenImage('assets/png/zen.webp');

  /// List of all assets
  List<AssetGenImage> get values => [forest, lake, misty, mountain, waves, zen];
}

class Assets {
  const Assets._();

  static const $AssetsAudioGen audio = $AssetsAudioGen();
  static const $AssetsColorsGen colors = $AssetsColorsGen();
  static const $AssetsDataGen data = $AssetsDataGen();
  static const $AssetsPngGen png = $AssetsPngGen();
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
