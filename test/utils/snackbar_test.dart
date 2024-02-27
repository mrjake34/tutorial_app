import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tutorial_app/product/utils/snackbar/custom_snackbar.dart';

void main() {
  testWidgets('Snackbar Test', (WidgetTester tester) async {
    final button = ElevatedButton(
      onPressed: () {
        CustomSnackBar.errorSnackBar('SnackBar Example.');
      },
      child: const Text('Show Snackbar'),
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: button),
      scaffoldMessengerKey: CustomSnackBar.messengerKey,
    ));

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('SnackBar Example.'), findsOneWidget);
  });
}
