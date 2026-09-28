
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  // Customization properties
  final Color activeTrackColor;
  final Color inactiveTrackColor;
  final Color activeThumbColor;
  final Color inactiveThumbColor;
  final double switchWidth;
  final double switchHeight;
  final double thumbSize;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    required this.activeTrackColor,
    required this.inactiveTrackColor,
    required this.activeThumbColor,
    required this.inactiveThumbColor,
    this.switchWidth = 52.0,
    this.switchHeight = 28.0,
    this.thumbSize = 22.0,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate padding dynamically to keep the thumb centered vertically
    final double verticalPadding = (switchHeight - thumbSize) / 2;

    return GestureDetector(
      onTap: () {
        onChanged(!value);
        FocusScope.of(context).unfocus();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.decelerate,
        width: switchWidth,
        height: switchHeight,
        padding: EdgeInsets.symmetric(
          horizontal: verticalPadding, // Matches horizontal starting gap to vertical gap
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(switchHeight / 2),
          // Uses gradient when active, falls back to solid color when inactive
          color: value ? activeTrackColor : inactiveTrackColor,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate,
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: thumbSize,
            height: thumbSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: value ? activeThumbColor : inactiveThumbColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
