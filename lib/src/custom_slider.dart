import 'package:flutter/material.dart';

class GradientSliderTrackShape extends RoundedRectSliderTrackShape {
  final double trackPadding;
  final double borderRadius;
  final List<Color> gradientColor;

  GradientSliderTrackShape({
    this.trackPadding = 12.0,
    this.borderRadius = 8.0,
    this.gradientColor = const [
      Color(0xffffffff),
      Color(0xff000000),
    ],
  });

  @override
  void paint(
      PaintingContext context,
      Offset offset, {
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required Animation<double> enableAnimation,
        required TextDirection textDirection,
        required Offset thumbCenter,
        Offset? secondaryOffset,
        bool isEnabled = false,
        bool isDiscrete = false,
        double additionalActiveTrackHeight = 2.0,
      }) {
    final Canvas canvas = context.canvas;

    final double trackHeight = sliderTheme.trackHeight ?? 4.0;

    final Rect trackRect = Rect.fromLTWH(
      offset.dx + trackPadding,
      thumbCenter.dy - trackHeight / 1.5,
      parentBox.size.width - 2 * trackPadding,
      trackHeight * 1.5,
    );

    final RRect trackRRect = RRect.fromRectAndRadius(
      trackRect,
      Radius.circular(borderRadius),
    );

    // Default / Custom Gradient
    final Gradient gradient = LinearGradient(
      colors: gradientColor,
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    );

    final Paint activePaint = Paint()
      ..shader = gradient.createShader(trackRect);

    final Paint inactivePaint = Paint()
      ..color = sliderTheme.inactiveTrackColor ?? Colors.grey.shade300;

    // Clip the entire track to keep rounded corners
    canvas.save();
    canvas.clipRRect(trackRRect);

    // Inactive track
    canvas.drawRect(trackRect, inactivePaint);

    // Active track
    final Rect activeRect = Rect.fromLTRB(
      trackRect.left,
      trackRect.top,
      thumbCenter.dx.clamp(trackRect.left, trackRect.right),
      trackRect.bottom,
    );

    canvas.drawRect(activeRect, activePaint);

    canvas.restore();
  }
}