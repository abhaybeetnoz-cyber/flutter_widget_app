import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PressUnPressBuilder extends StatelessWidget {
  final Widget Function(bool isPressed) builder;
  final void Function()? onTap;
  final bool isActive;

  PressUnPressBuilder({
    super.key,
    this.isActive = true,
    required this.onTap,
    required this.builder,
  });

  final RxBool isPressed = false.obs;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        if (!isActive) return;
        isPressed.value = true;
      },
      onPointerUp: (_) {
        if (!isActive) return;
        isPressed.value = false;
      },
      onPointerCancel: (_) {
        if (!isActive) return;
        isPressed.value = false;
      },
      child: GestureDetector(
        onTap: isActive ? onTap : null,
        onDoubleTap: () {},
        child: Obx(
              () => builder(isPressed.value),
        ),
      ),
    );
  }
}