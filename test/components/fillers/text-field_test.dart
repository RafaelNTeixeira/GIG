import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gig/components/fillers/text-field.dart';


void main() {
    final controller = TextEditingController();
    final hintText = 'Enter text here';
    final obscureText = true;
    final icon = Icons.lock;
    final limit = 10;

    testWidgets('should display hint text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicTextField(
              controller: controller,
              hintText: hintText,
              obscureText: obscureText,
              icon: icon,
              limit: limit,
            ),
          ),
        ),
      );

      expect(find.text(hintText), findsOneWidget);
    });

    testWidgets('should display icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicTextField(
              controller: controller,
              hintText: hintText,
              obscureText: obscureText,
              icon: icon,
              limit: limit,
            ),
          ),
        ),
      );

      expect(find.byIcon(icon), findsOneWidget);
    });

    testWidgets('should limit text input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicTextField(
              controller: controller,
              hintText: hintText,
              obscureText: obscureText,
              icon: icon,
              limit: limit,
            ),
          ),
        ),
      );

      final text = 'a' * (limit + 1);
      await tester.enterText(find.byType(TextField), text);

      expect(controller.text, text.substring(0, limit));
    });

    testWidgets('should obscure text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicTextField(
              controller: controller,
              hintText: hintText,
              obscureText: obscureText,
              icon: icon,
              limit: limit,
            ),
          ),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
      expect(tester.widget<TextField>(find.byType(TextField)).obscureText, isTrue);
    });

    testWidgets('should display input text', (WidgetTester tester) async {
      final inputText = 'Some text';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicTextField(
              controller: controller,
              hintText: hintText,
              obscureText: obscureText,
              icon: icon,
              limit: limit,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), inputText);

      expect(find.text(inputText), findsOneWidget);
    });
}
