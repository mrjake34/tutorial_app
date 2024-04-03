import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tutorial_app/feature/splash/view/splash_view.dart';

void main() {
  testWidgets('Splash View Test', (widgetTester) async {
    const splash = SplashView();

    await widgetTester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: splash,
      ),
    ));

    await widgetTester.tap(find.byIcon(Icons.home));
    await widgetTester.tap(find.byIcon(Icons.image));
    await widgetTester.tap(find.byIcon(Icons.person));

    expect(find.byIcon(Icons.abc), findsOneWidget);
  });
}
