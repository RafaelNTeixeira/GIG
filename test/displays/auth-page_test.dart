import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gig/displays/auth-page.dart';
import 'package:gig/displays/login-page.dart';
import 'package:gig/displays/register-page.dart';

void main() {
  group('AuthPage widget', () {
    testWidgets('displays login page by default', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: AuthPage()));
      expect(find.byType(LoginPage), findsOneWidget);
    });

    testWidgets('email text field exists', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginPage()));
      final emailTextField = find.byType(TextField).first;
      expect(emailTextField, findsOneWidget);

      // Get the TextEditingController instance for the email TextField
      final TextEditingController emailController =
      tester.widget<TextField>(emailTextField).controller!;

      // Enter text in the email TextField
      await tester.enterText(emailTextField, 'test@test.com');
      expect(emailController.text, 'test@test.com');
    });
    testWidgets('password text field exists', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginPage()));
      final passwordTextField = find.byType(TextField).at(1);
      expect(passwordTextField, findsOneWidget);

      // Get the TextEditingController instance for the password TextField
      final TextEditingController passwordController =
      tester.widget<TextField>(passwordTextField).controller!;

      // Enter text in the password TextField
      await tester.enterText(passwordTextField, 'password');
      expect(passwordController.text, 'password');
    });

  });
}


