import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tutorial_app/feature/profile/model/profile_model.dart';
import 'package:tutorial_app/feature/profile/view/profile_view.dart';

void main() {
  testWidgets('Splash View Test', (widgetTester) async {
    const profile = ProfileField(
      userModel: ProfileModel(
          fullName: 'Alkan',
          email: 'alkanatas34@gmail.com',
          phoneNumber: '05467884453'),
    );

    await widgetTester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: profile,
      ),
    ));

    expect(find.text('Alkan'), findsOneWidget);
    expect(find.text('alkanatas34@gmail.com'), findsOneWidget);
    expect(find.text('05467884453'), findsOneWidget);
  });
}
