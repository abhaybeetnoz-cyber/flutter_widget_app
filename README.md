# Flutter Widget App

[![pub package](https://img.shields.io/pub/v/flutter_widget_app.svg)](https://pub.dev/packages/flutter_widget_app)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

`flutter_widget_app` is a comprehensive, production-ready Flutter package originally created by **Abhay Patel** with contributions from **Sujal Rabadiya**, providing high-performance customizable UI widgets, press animations, custom switches & sliders, gradient text, shimmer effects, and responsive layout utilities.

---

## Features

* **Press & Unpress Interactive Widgets**: Multiple variants (`PressUnpress`, `PressUnPressBuilder`, `PressUnPressDecoration`, `PressUnpressWidget`, `PressUnpressResult`) for image/widget touch press feedback.
* **Tinted Clicker (`TintedClicker`)**: Highly customizable button clicker supporting touch color tinting and scale animations (`TintedClickerMode.onlyTint`, `TintedClickerMode.onlyAnim`, `TintedClickerMode.both`).
* **Gradient Text (`GradientText`)**: Apply linear or radial gradients (`GradientType.linear`, `GradientType.radial`) with various directions to text.
* **Custom Controls**:
  * `CustomSwitch`: Animated toggle switch with active/inactive track and thumb colors.
  * `GradientSliderTrackShape` & `CustomThumbShape`: Slider theme shapes for custom gradient tracks and thumbs.
  * `SlidingSegmentBar`: Animated indicator bar with `SegmentBarStyle.sliding` and `SegmentBarStyle.growing`.
* **Shimmer Effects (`Shimmer`)**: High-performance shimmer effect (`Shimmer` & `Shimmer.fromColors`) with configurable directions and speeds.
* **Responsive Scaling (`ScaleUtil`)**: Figma-based responsive scaling extensions (`.w`, `.h`, `.sp`, `.r`, `.t`, `.dw`, `.dh`, `.sw`, `.sh`).

---

## Installation

Add `flutter_widget_app` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_widget_app: ^1.0.4
```

Or via terminal:

```bash
flutter pub add flutter_widget_app
```

---

## Getting Started

Import the package in your Dart code:

```dart
import 'package:flutter_widget_app/flutter_widget_app.dart';
```

Initialize `ScaleUtil` in your root widget if using responsive scaling:

```dart
ScaleUtil.init(context, designSize: const Size(1242, 2688));
```

---

## Component Reference & Usage

### 1. TintedClicker
Provides touch scaling and tint feedback.

```dart
TintedClicker(
  mode: TintedClickerMode.both,
  color: Colors.black26,
  pressedScale: 0.95,
  onTap: () {
    print('Clicked!');
  },
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    decoration: BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(8),
    ),
    child: const Text('Tap Me', style: TextStyle(color: Colors.white)),
  ),
)
```

### 2. GradientText
Applies linear or radial gradients to text.

```dart
GradientText(
  'Stunning Gradient',
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  colors: [Colors.purple, Colors.orange, Colors.pink],
  gradientDirection: GradientDirection.ltr,
)
```

### 3. PressUnPressBuilder
Builder widget exposing the `isPressed` boolean state.

```dart
PressUnPressBuilder(
  onTap: () {
    print('Pressed!');
  },
  builder: (isPressed) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isPressed ? Colors.indigo.shade700 : Colors.indigo,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text('Pressable Container', style: TextStyle(color: Colors.white)),
    );
  },
)
```

### 4. CustomSwitch
Animated customizable toggle switch.

```dart
CustomSwitch(
  value: true,
  onChanged: (val) {
    print('Switch changed: $val');
  },
  activeTrackColor: Colors.indigo,
  inactiveTrackColor: Colors.grey.shade300,
  activeThumbColor: Colors.white,
  inactiveThumbColor: Colors.white,
)
```

### 5. SlidingSegmentBar
Indicator bar with animated sliding or growing styles.

```dart
SlidingSegmentBar(
  style: SegmentBarStyle.sliding,
  height: 4,
  fillGradient: LinearGradient(
    colors: [Colors.indigo, Colors.purple],
  ),
)
```

### 6. Shimmer Loading Effect

```dart
Shimmer.fromColors(
  baseColor: Colors.grey[300]!,
  highlightColor: Colors.grey[100]!,
  child: Container(
    width: 200,
    height: 20,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
  ),
)
```

---

## Example App

Check out the [example app](example/lib/main.dart) for a complete working showcase of all components.

---

## Authors & Contributors

* **Abhay Patel** (Original Author)
* **Sujal Rabadiya** (Contributor)

---

## License

This package is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
