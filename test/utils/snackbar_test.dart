import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tutorial_app/product/utils/snackbar/custom_snackbar.dart';

void main() {
  testWidgets('Snackbar Test', (widgetTester) async {
    final button = ElevatedButton(
      onPressed: () => CustomSnackBar.showSnackBar(text: 'Hello World'),
      child: const Text('Show Snackbar'),
    );

    await widgetTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: button,
        ),
        scaffoldMessengerKey: CustomSnackBar.messengerKey,
      ),
    );

    await widgetTester.tap(find.byWidget(button));
    await widgetTester.pumpAndSettle();

    expect(find.byWidget(button), findsOneWidget);
    expect(find.text('Show Snackbar'), findsOneWidget);
    expect(find.text('Hello World'), findsOneWidget);
  });
}
