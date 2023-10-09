import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gig/components/buttons/offer-display.dart';


void main() {
  group('OfferDisplay', () {
    const name = 'John Doe';
    const location = 'New York';
    const email = 'johndoe@example.com';
    const serviceType = 'Service Type';

    testWidgets('Renders the OfferDisplay widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OfferDisplay(
              name: name,
              location: location,
              email: email,
              serviceType: serviceType,
              onPress: () {}, // Provide an empty callback
            ),
          ),
        ),
      );

      expect(find.text(name), findsOneWidget);
      expect(find.text('Location: $location'), findsOneWidget);
      expect(find.text('Email: $email'), findsOneWidget);
      expect(find.text(serviceType), findsOneWidget);
    });

    testWidgets('Invokes the onPress callback when tapped', (WidgetTester tester) async {
      bool callbackInvoked = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OfferDisplay(
              name: name,
              location: location,
              email: email,
              serviceType: serviceType,
              onPress: () {
                callbackInvoked = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(callbackInvoked, isTrue);
    });
  });
}
