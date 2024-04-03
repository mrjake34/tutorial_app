import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tutorial_app/product/widgets/text_field/custom_text_field.dart';

void main() {
  testWidgets('CustomTextField Test', (widgetTester) async {
    final controller = TextEditingController();
    final textField = CustomTextField(
        controller: controller,
        name: 'Test TextField',
        label: 'Test',
        validators: const []);

    await widgetTester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: textField,
      ),
    ));

    await widgetTester.enterText(find.byWidget(textField), 'Hello World');

    expect(find.text('Test'), findsOneWidget);
  });
}
