import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blocpattern/views/loading.dart';

void main() {
  Widget makeThisTestable({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }
  testWidgets('', (WidgetTester tester) async {
    LoadingScreen page = const LoadingScreen();

    await tester.pumpWidget(makeThisTestable(child: page));
  });
}