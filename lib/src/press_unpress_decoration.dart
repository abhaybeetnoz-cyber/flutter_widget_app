import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PressUnPressDecoration extends StatelessWidget {
  final BoxDecoration press;
  final BoxDecoration unpress;
  final Widget child;
  final double width;
  final double height;
  final void Function()? onTap;
  final bool isActive;

  PressUnPressDecoration({super.key,
    this.isActive = true,
    required this.onTap,
    required this.press,
    required this.unpress,
    required this.child,
    required this.width,
    required this.height,
  });

  final RxBool isPressed = false.obs;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        if(!isActive) return;
        isPressed.value = true;
      },
      onPointerUp: (PointerUpEvent event) {
        if(!isActive) return;
        isPressed.value = false;
      },
      onPointerCancel: (PointerCancelEvent event) {
        if(!isActive) return;
        isPressed.value = false;
      },
      child: GestureDetector(
        onTap: isActive ? onTap : null,
        onDoubleTap: () {},
        child: Obx(
              () => Container(
                width: width,
                height: height,
                decoration: isPressed.value ? press : unpress,
                child: child,
              ),
        ),
      ),
    );
  }
}
