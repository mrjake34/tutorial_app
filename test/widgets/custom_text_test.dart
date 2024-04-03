import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tutorial_app/product/widgets/text/custom_text.dart';

void main() {
  testWidgets('CustomText Test', (widgetTester) async {
    const text = CustomText('Hello World');

    await widgetTester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: text,
      ),
    ));

    expect(find.text('Hello World'), findsOneWidget);
  });
}
