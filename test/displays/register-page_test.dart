import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gig/components/buttons/sign_up-button.dart';
import 'package:gig/displays/login-page.dart';
import 'package:gig/displays/register-page.dart';

void main() {
  testWidgets('RegisterPage is rendered successfully', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: RegisterPage(),));

    expect(find.text('Get into GIG!'), findsOneWidget);
    expect(find.text('One step closer'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(SignUpButton), findsOneWidget);
  });

  testWidgets('Tapping the "Sign in" text navigates to the login page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: RegisterPage()));
    await tester.tap(find.text('Sign in'));
    await tester.pumpAndSettle();

    expect(find.byType(LoginPage), findsOneWidget);
  });
}