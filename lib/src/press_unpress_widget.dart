import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PressUnpressWidget extends StatelessWidget {
  final Widget widget;
  final void Function()? onTap;
  final bool isActive;

  PressUnpressWidget({
    super.key,
    required this.widget,
    required this.onTap,
    this.isActive = true,
  });

  final RxBool isPressed = false.obs;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        if (!isActive) return;
        isPressed.value = true;
      },
      onPointerUp: (PointerUpEvent event) {
        if (!isActive) return;
        isPressed.value = false;
      },
      onPointerCancel: (PointerCancelEvent event) {
        if (!isActive) return;
        isPressed.value = false;
      },
      child: GestureDetector(
        onTap: isActive ? onTap : null,
        onDoubleTap: () {},
        child: Obx(
          () => Opacity(
            opacity: isPressed.value || !isActive ? 0.5 : 1.0,
            child: widget,
          ),
        ),
      ),
    );
  }
}
