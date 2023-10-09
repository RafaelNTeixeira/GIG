import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gig/components/buttons/sign_up-button.dart';

void main() {
    testWidgets('should display name', (WidgetTester tester) async {
      // Arrange
      final widget = SignUpButton(onPress: () {}, name: 'Sign up');

      // Act
      await tester.pumpWidget(MaterialApp(home: widget));

      // Assert
      expect(find.text('Sign up'), findsOneWidget);
    });

    testWidgets('should call onPress when pressed', (WidgetTester tester) async {
      // Arrange
      var pressed = false;
      final widget = SignUpButton(onPress: () => pressed = true, name: 'Sign up');

      // Act
      await tester.pumpWidget(MaterialApp(home: widget));
      await tester.tap(find.byType(GestureDetector));

      // Assert
      expect(pressed, isTrue);
    });
}
