/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_arrow_down.svg
  String get icArrowDown => 'assets/icons/ic_arrow_down.svg';

  /// File path: assets/icons/ic_arrow_up.svg
  String get icArrowUp => 'assets/icons/ic_arrow_up.svg';

  /// File path: assets/icons/ic_date_of_b.svg
  String get icDateOfB => 'assets/icons/ic_date_of_b.svg';

  /// File path: assets/icons/ic_flag_india.svg
  String get icFlagIndia => 'assets/icons/ic_flag_india.svg';

  /// File path: assets/icons/ic_google.svg
  String get icGoogle => 'assets/icons/ic_google.svg';

  /// File path: assets/icons/ic_image_add.svg
  String get icImageAdd => 'assets/icons/ic_image_add.svg';

  /// File path: assets/icons/ic_msg_sent.svg
  String get icMsgSent => 'assets/icons/ic_msg_sent.svg';

  /// File path: assets/icons/ic_smiley.svg
  String get icSmiley => 'assets/icons/ic_smiley.svg';

  /// List of all assets
  List<String> get values => [
    icArrowDown,
    icArrowUp,
    icDateOfB,
    icFlagIndia,
    icGoogle,
    icImageAdd,
    icMsgSent,
    icSmiley,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/img_splash.svg
  String get imgSplash => 'assets/images/img_splash.svg';

  /// File path: assets/images/img_splash_one.jpg
  AssetGenImage get imgSplashOne =>
      const AssetGenImage('assets/images/img_splash_one.jpg');

  /// List of all assets
  List<dynamic> get values => [imgSplash, imgSplashOne];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/loading.json
  String get loading => 'assets/lottie/loading.json';

  /// File path: assets/lottie/loginag_common.json
  String get loginagCommon => 'assets/lottie/loginag_common.json';

  /// List of all assets
  List<String> get values => [loading, loginagCommon];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
