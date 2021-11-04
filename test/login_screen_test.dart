import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blocpattern/views/login.dart';

void main() {
  Widget makeThisTestable({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }
  testWidgets('', (WidgetTester tester) async {
    LoginScreen page = const LoginScreen();

    await tester.pumpWidget(makeThisTestable(child: page));
  });
}