import 'package:flutter/material.dart';

/// The type of gradient to apply.
enum GradientType {
  /// A linear gradient.
  linear,

  /// A radial gradient.
  radial,
}

/// Direction to apply in the gradient.
enum GradientDirection {
  /// Bottom to top.
  btt,

  /// Left to right.
  ltr,

  /// Right to left.
  rtl,

  /// Top to bottom.
  ttb,

  /// Bottom left to top right.
  blttr,

  /// Bottom right to top left.
  brttl,

  /// Top left to bottom right.
  tltbr,

  /// Top right to bottom left.
  trtbl;

  (Alignment, Alignment) get alignment {
    return switch (this) {
      GradientDirection.ttb => (Alignment.topCenter, Alignment.bottomCenter),
      GradientDirection.ltr => (Alignment.centerLeft, Alignment.centerRight),
      GradientDirection.rtl => (Alignment.centerRight, Alignment.centerLeft),
      GradientDirection.btt => (Alignment.bottomCenter, Alignment.topCenter),
      GradientDirection.blttr => (Alignment.bottomLeft, Alignment.topRight),
      GradientDirection.brttl => (Alignment.bottomRight, Alignment.topLeft),
      GradientDirection.tltbr => (Alignment.topLeft, Alignment.bottomRight),
      GradientDirection.trtbl => (Alignment.topRight, Alignment.bottomLeft),
    };
  }
}

/// A gradient text.
class GradientText extends StatelessWidget {
  /// Colors used to show the gradient.
  final List<Color> colors;

  /// Direction in which the gradient will be displayed.
  final GradientDirection gradientDirection;

  /// The type of gradient to apply.
  final GradientType gradientType;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// The radius of the gradient, as a fraction of the shortest side
  /// of the paint box.
  final double radius;

  /// If non-null, the style to use for this text.
  final TextStyle? style;

  /// The text to display.
  final String text;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// Maximum number of lines for the text to span.
  final int? maxLines;

  /// Whether the text should break at soft line breaks.
  final bool? softWrap;

  /// Gradient stops
  final List<double>? stops;

  const GradientText(
    this.text, {
    required this.colors,
    this.gradientDirection = GradientDirection.ltr,
    this.gradientType = GradientType.linear,
    super.key,
    this.overflow,
    this.radius = 1.0,
    this.style,
    this.textAlign,
    this.stops,
    this.maxLines,
    this.softWrap,
  }) : assert(colors.length >= 2, 'Colors list must have at least two colors');

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        switch (gradientType) {
          case GradientType.linear:
            final (Alignment beginAlignment, Alignment endAlignment) = gradientDirection.alignment;
            return LinearGradient(begin: beginAlignment, colors: colors, stops: stops, end: endAlignment).createShader(bounds);
          case GradientType.radial:
            return RadialGradient(colors: colors, radius: radius).createShader(bounds);
        }
      },
      child: Text(
        text,
        overflow: overflow,
        style: style != null ? style?.copyWith(color: Colors.white) : const TextStyle(color: Colors.white),
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
      ),
    );
  }
}
