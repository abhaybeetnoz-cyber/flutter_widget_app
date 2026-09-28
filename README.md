# Flutter Widget App

A collection of reusable Flutter widgets designed to make your app UI more interactive and beautiful.

## Features

* Custom press animation widgets
* Reusable button components
* Shimmer loading effects
* Customizable widget styles
* Easy integration into Flutter projects

## Installation

Add the package to your Flutter project using:

```bash
flutter pub add flutter_widget_app
```

Or add it manually to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_widget_app: ^1.0.0
```

## Import

Import the package into your Dart file:

```dart
import 'package:flutter_widget_app/flutter_widget_app.dart';
```

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:flutter_widget_app/flutter_widget_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('Flutter Widget App'),
        ),
      ),
    );
  }
}
```

## Available Widgets

This package includes the following reusable widgets:

* `PressUnpress`
* `PressUnpressResult`
* `PressUnpressCommen`
* `Shimmer`
* `TintedClicker`dart pub publish --dry-run-

Refer to the example application for usage demonstrations.

## Requirements

* Flutter
* Dart

## License

This package is released under the MIT License. See the [LICENSE](LICENSE) file for details.
