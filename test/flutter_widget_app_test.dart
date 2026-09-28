import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widget_app/flutter_widget_app.dart';

void main() {
  testWidgets('Package widgets can be imported', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: Text('Press Unpress'))));

    expect(find.text('Press Unpress'), findsOneWidget);
  });
}
