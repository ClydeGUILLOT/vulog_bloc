import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blocpattern/views/dog_listview.dart';

void main() {
  Widget makeThisTestable({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }
  testWidgets('', (WidgetTester tester) async {
    ListScreen page = const ListScreen();

    await tester.pumpWidget(makeThisTestable(child: page));
  });
}