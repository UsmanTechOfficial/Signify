/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/services.dart';
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/doc_icon.svg
  SvgGenImage get docIcon => const SvgGenImage('assets/icons/doc_icon.svg');

  /// File path: assets/icons/google_icon.svg
  SvgGenImage get googleIcon =>
      const SvgGenImage('assets/icons/google_icon.svg');

  /// File path: assets/icons/ic_agreements_filled.svg
  SvgGenImage get icAgreementsFilled =>
      const SvgGenImage('assets/icons/ic_agreements_filled.svg');

  /// File path: assets/icons/ic_agreements_outlined.svg
  SvgGenImage get icAgreementsOutlined =>
      const SvgGenImage('assets/icons/ic_agreements_outlined.svg');

  /// File path: assets/icons/ic_home_filled.svg
  SvgGenImage get icHomeFilled =>
      const SvgGenImage('assets/icons/ic_home_filled.svg');

  /// File path: assets/icons/ic_home_outlined.svg
  SvgGenImage get icHomeOutlined =>
      const SvgGenImage('assets/icons/ic_home_outlined.svg');

  /// File path: assets/icons/ic_profile_filled.svg
  SvgGenImage get icProfileFilled =>
      const SvgGenImage('assets/icons/ic_profile_filled.svg');

  /// File path: assets/icons/ic_profile_outlined.svg
  SvgGenImage get icProfileOutlined =>
      const SvgGenImage('assets/icons/ic_profile_outlined.svg');

  /// File path: assets/icons/ic_templates_filled.svg
  SvgGenImage get icTemplatesFilled =>
      const SvgGenImage('assets/icons/ic_templates_filled.svg');

  /// File path: assets/icons/ic_templates_outlined.svg
  SvgGenImage get icTemplatesOutlined =>
      const SvgGenImage('assets/icons/ic_templates_outlined.svg');

  /// File path: assets/icons/more_icon.svg
  SvgGenImage get moreIcon => const SvgGenImage('assets/icons/more_icon.svg');

  /// File path: assets/icons/more_vert_icon.svg
  SvgGenImage get moreVertIcon =>
      const SvgGenImage('assets/icons/more_vert_icon.svg');

  /// File path: assets/icons/pencil_icon.svg
  SvgGenImage get pencilIcon =>
      const SvgGenImage('assets/icons/pencil_icon.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        docIcon,
        googleIcon,
        icAgreementsFilled,
        icAgreementsOutlined,
        icHomeFilled,
        icHomeOutlined,
        icProfileFilled,
        icProfileOutlined,
        icTemplatesFilled,
        icTemplatesOutlined,
        moreIcon,
        moreVertIcon,
        pencilIcon
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/onBoard_img.png
  AssetGenImage get onBoardImg =>
      const AssetGenImage('assets/images/onBoard_img.png');

  /// File path: assets/images/profile_img.png
  AssetGenImage get profileImg =>
      const AssetGenImage('assets/images/profile_img.png');

  /// File path: assets/images/splash_img.png
  AssetGenImage get splashImg =>
      const AssetGenImage('assets/images/splash_img.png');

  /// List of all assets
  List<AssetGenImage> get values => [onBoardImg, profileImg, splashImg];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/docs.json
  String get docs => 'assets/json/docs.json';

  /// List of all assets
  List<String> get values => [docs];
}

class Assets {
  Assets._();

  static const String flow = 'assets/flow.pdf';
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();

  /// List of all assets
  static List<String> get values => [flow];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final BytesLoader loader;
    if (_isVecFormat) {
      loader = AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
