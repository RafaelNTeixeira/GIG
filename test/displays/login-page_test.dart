import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gig/displays/login-page.dart';
import 'package:gig/displays/register-page.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
    testWidgets('Test that the widget displays the correct title and subtitle text',
            (WidgetTester tester) async {
          await tester.pumpWidget(MaterialApp(home: LoginPage()));

          expect(find.text('Welcome to GIG!'), findsOneWidget);
          expect(find.text('Solve your life problems more easily'), findsOneWidget);
        });


    testWidgets('Test that the RegisterPage is navigated to when the "Register here" text is pressed',
            (WidgetTester tester) async {
          await tester.pumpWidget(MaterialApp(home: LoginPage()));

          await tester.tap(find.text('Register'));
          await tester.pumpAndSettle();

          expect(find.byType(RegisterPage), findsOneWidget);
        });
}



