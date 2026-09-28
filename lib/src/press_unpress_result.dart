import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PressUnpressResult extends StatefulWidget {
  final String image;
  void Function()? onTap;
  void Function()? onLongPressCancel;
  void Function(LongPressDownDetails)? onLongPressDown;
  void Function(LongPressEndDetails)? onLongPressEnd;
  final double? height;
  final double? width;

  PressUnpressResult({super.key, 
    required this.image,
    required this.onTap,
    required this.onLongPressEnd,
    required this.onLongPressDown,
    required this.onLongPressCancel,
    this.height,
    this.width,
  });

  @override
  _ImageContainerState createState() => _ImageContainerState();
}

class _ImageContainerState extends State<PressUnpressResult> {
  final _imageAssetController = StreamController<String>.broadcast();
  late String _currentImageAsset;
  RxBool isPressed = false.obs;

  @override
  void initState() {
    super.initState();
    _currentImageAsset = widget.image;
  }

  @override
  void dispose() {
    _imageAssetController.close();
    super.dispose();
  }

  void _changeImage(String newImageAsset) {
    _imageAssetController.add(newImageAsset);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        _changeImage(widget.image);
        isPressed.value = true;
      },
      onPointerUp: (PointerUpEvent event) {
        _changeImage(widget.image);
        isPressed.value = false;
      },
      onPointerCancel: (PointerCancelEvent event) {
        _changeImage(widget.image);
        isPressed.value = false;
      },
      child: GestureDetector(
        onTap: widget.onTap,
        onDoubleTap: () {},
        onLongPressCancel: widget.onLongPressCancel,
        onLongPressDown: widget.onLongPressDown,
        onLongPressEnd: widget.onLongPressEnd,
        child: StreamBuilder<String>(
            stream: _imageAssetController.stream,
            initialData: _currentImageAsset,
            builder: (context, snapshot) {
              return Obx(
                () => Opacity(
                  opacity: isPressed.value ? 0.5 : 1.0,
                  child: Image.asset(
                    snapshot.data!,
                    width: widget.width,
                    height: widget.height,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
