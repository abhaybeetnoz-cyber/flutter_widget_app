import 'package:flutter/material.dart';

/// Animation style of [SlidingSegmentBar].
enum SegmentBarStyle {
  /// A fixed-size segment slides across the track, then repeats.
  sliding,

  /// The fill grows from 0 to full width, then repeats.
  growing,
}

class SlidingSegmentBar extends StatefulWidget {
  /// Which animation to play.
  final SegmentBarStyle style;

  /// Bar thickness.
  final double height;

  /// Segment width as a fraction of the track (used by [SegmentBarStyle.sliding]).
  final double segmentFraction;

  /// Corner radius. Defaults to a pill shape ([height] / 2) for
  /// [SegmentBarStyle.sliding] and 0 for [SegmentBarStyle.growing].
  final double? radius;

  final Color trackColor;

  /// Duration of one full loop. Make larger for slower.
  final Duration duration;

  /// Solid fill color. Ignored when [fillGradient] is provided.
  final Color fillColor;

  /// Optional gradient fill; takes priority over [fillColor].
  final Gradient? fillGradient;

  const SlidingSegmentBar({
    super.key,
    this.style = SegmentBarStyle.sliding,
    this.height = 3,
    this.segmentFraction = 0.22,
    this.radius,
    this.trackColor = const Color(0xFF9B9B9B),
    this.duration = const Duration(seconds: 4),
    this.fillColor = const Color(0xFF000000),
    this.fillGradient,
  }) : assert(segmentFraction > 0 && segmentFraction <= 1);

  @override
  State<SlidingSegmentBar> createState() => _SlidingSegmentBarState();
}

class _SlidingSegmentBarState extends State<SlidingSegmentBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: widget.duration)..repeat();
  }

  @override
  void didUpdateWidget(covariant SlidingSegmentBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _c
        ..duration = widget.duration
        ..repeat();
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  double get _radius =>
      widget.radius ??
          (widget.style == SegmentBarStyle.sliding ? widget.height / 2 : 0);

  BoxDecoration get _fillDecoration => BoxDecoration(
    color: widget.fillGradient == null ? widget.fillColor : null,
    gradient: widget.fillGradient,
    borderRadius: BorderRadius.circular(_radius),
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;

        return ClipRRect(
          borderRadius: BorderRadius.circular(_radius),
          child: SizedBox(
            width: w,
            height: widget.height,
            child: Stack(
              children: [
                // Track
                Positioned.fill(child: ColoredBox(color: widget.trackColor)),
                // Animated fill
                AnimatedBuilder(
                  animation: _c,
                  builder: (ctx, _) => switch (widget.style) {
                    SegmentBarStyle.sliding => _buildSliding(w),
                    SegmentBarStyle.growing => _buildGrowing(w),
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSliding(double w) {
    final segW = w * widget.segmentFraction;
    final dx = -segW + (w + segW) * _c.value; // -segW → w
    return Transform.translate(
      offset: Offset(dx, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: segW,
          height: widget.height,
          decoration: _fillDecoration,
        ),
      ),
    );
  }

  Widget _buildGrowing(double w) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: w * _c.value, // 0 → w
        height: widget.height,
        decoration: _fillDecoration,
      ),
    );
  }
}