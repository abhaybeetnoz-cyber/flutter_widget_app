import 'package:flutter/material.dart';

class CustomThumbShape extends SliderComponentShape {
  final double thumbRadius;
  final Gradient gradient;

  CustomThumbShape({
    this.thumbRadius = 12.0,
    this.gradient = const LinearGradient(
      colors: [Colors.white, Colors.black],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final Paint thumbPaint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(center: center, radius: thumbRadius),
      );

    canvas.drawCircle(center, thumbRadius, thumbPaint);
  }
}
