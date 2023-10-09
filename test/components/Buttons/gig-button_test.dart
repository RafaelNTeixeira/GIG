import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gig/components/buttons/gig-button.dart';

void main() {
  group('GIGButton', () {
    testWidgets('displays text and has tap callback', (WidgetTester tester) async {
      var tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GIGButton(
              onPress: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('GIG'), findsOneWidget);

      await tester.tap(find.text('GIG'));
      expect(tapped, true);
    });

    testWidgets('has correct text style', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GIGButton(),
          ),
        ),
      );

      final text = tester.widget<Text>(
        find.text('GIG'),
      );

      expect(text.style?.fontWeight, equals(FontWeight.bold));
      expect(text.style?.fontSize, equals(30));
      expect(text.style?.fontFamily, equals('Poppins-Medium'));
      expect(text.style?.color, equals(Colors.teal.shade400));
    });
  });
}
