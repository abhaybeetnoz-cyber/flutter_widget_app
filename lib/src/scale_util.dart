import 'dart:math';
import 'package:flutter/material.dart';

class ScaleUtil {
  static late double scale;
  static late double _screenWidth;
  static late double _screenHeight;

  static late double designWidth;
  static late double designHeight;

  static late double _fontSizeDiff;

  static void init(BuildContext context, {Size? designSize, double? fontSizeDiff}) {
    designSize ??= const Size(1242, 2688);
    fontSizeDiff ??= 0;

    final size = MediaQuery.of(context).size;

    _screenWidth = size.width;
    _screenHeight = size.height;

    designWidth = designSize.width;
    designHeight = designSize.height;

    _fontSizeDiff = fontSizeDiff;

    final scaleW = size.width / designSize.width;
    final scaleH = size.height / designSize.height;

    // final shortestSide = size.shortestSide;
    // final isTablet = shortestSide >= 600;

    double diagonalLogical = sqrt((_screenHeight * _screenHeight) + (_screenWidth * _screenWidth));
    double diagonalInches = diagonalLogical / 160;
    final isTablet = diagonalInches >= 5;

    if (isTablet) {
      scale = scaleW;
    } else {
      scale = min(scaleW, scaleH);
    }
  }
}

extension FigmaScaleExtension on num {
  double get w => this * ScaleUtil.scale;

  double get h => this * ScaleUtil.scale;

  double get sp => this * ScaleUtil.scale;

  double get r => this * ScaleUtil.scale;

  double get t => this * ScaleUtil.scale - ScaleUtil._fontSizeDiff;

  /// Percentage of the design width converted to actual screen width.
  /// Example: 1150.dw with design width 1242 = 1150 / 1242 * screenWidth
  double get dw =>
      (this / ScaleUtil.designWidth) * ScaleUtil._screenWidth;

  /// Percentage of the design height converted to actual screen height.
  double get dh =>
      (this / ScaleUtil.designHeight) * ScaleUtil._screenHeight;

  /// Screen-width percentage.
  /// Example: 0.5.sw = 50% of screen width
  double get sw => this * ScaleUtil._screenWidth;

  /// Screen-height percentage.
  /// Example: 0.5.sh = 50% of screen height
  double get sh => this * ScaleUtil._screenHeight;
}