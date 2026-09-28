import 'package:flutter/material.dart';

enum TintedClickerMode { onlyTint, onlyAnim, both }

class TintedClicker extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final Color color;
  final int delayTime;
  final double pressedScale;
  final TintedClickerMode mode;
  final VoidCallback? onLongTap;

  const TintedClicker({
    super.key,
    required this.child,
    required this.onTap,
    this.color = Colors.black12,
    this.delayTime = 300,
    this.pressedScale = 0.95,
    this.mode = TintedClickerMode.onlyAnim,
    this.onLongTap,
  });

  @override
  State<TintedClicker> createState() => _TintedClickerState();
}

class _TintedClickerState extends State<TintedClicker>
    with SingleTickerProviderStateMixin {
  bool isTouchDown = false;
  bool _isProcessing = false;

  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      reverseDuration: const Duration(milliseconds: 100),
      value: 0.0, // start at full scale
    );

    _scaleAnim = Tween<double>(
      begin: 1.0,
      end: widget.pressedScale,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (_isProcessing) return;
    _isProcessing = true;

    widget.onTap();

    // handle scale reverse separately
    if (widget.mode == TintedClickerMode.onlyAnim ||
        widget.mode == TintedClickerMode.both) {
      _controller.reverse();
    }

    // reset tint separately
    if (widget.mode == TintedClickerMode.onlyTint ||
        widget.mode == TintedClickerMode.both) {
      setState(() => isTouchDown = false);
    }

    Future.delayed(Duration(milliseconds: widget.delayTime), () {
      _isProcessing = false;
    });
  }

  void _onTapDown(_) {
    if (widget.mode == TintedClickerMode.onlyTint ||
        widget.mode == TintedClickerMode.both) {
      setState(() {
        isTouchDown = true;
      });
    }

    if (widget.mode == TintedClickerMode.onlyAnim ||
        widget.mode == TintedClickerMode.both) {
      _controller.forward();
    }
  }

  void _onTapUp(_) {
    _handleTap();
  }

  void _onTapCancel() {
    if (widget.mode == TintedClickerMode.onlyTint ||
        widget.mode == TintedClickerMode.both) {
      setState(() {
        isTouchDown = false;
      });
    }

    if (widget.mode == TintedClickerMode.onlyAnim ||
        widget.mode == TintedClickerMode.both) {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onLongPress: widget.onLongTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          Widget result = widget.child;

          // Tint
          if (widget.mode == TintedClickerMode.onlyTint ||
              widget.mode == TintedClickerMode.both) {
            result = ColorFiltered(
              colorFilter: ColorFilter.mode(
                isTouchDown ? widget.color : Colors.transparent,
                BlendMode.srcATop,
              ),
              child: result,
            );
          }

          // Scale
          if (widget.mode == TintedClickerMode.onlyAnim ||
              widget.mode == TintedClickerMode.both) {
            result = Transform.scale(scale: _scaleAnim.value, child: result);
          }

          return result;
        },
        child: widget.child,
      ),
    );
  }
}
