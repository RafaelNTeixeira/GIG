import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gig/components/elements/background-image.dart';


void main() {
  group('BackgroundImage', () {
    testWidgets('should display an image and back button', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BackgroundImage(
            size: 200,
            image: 'lib/images/house-cleaning.jpg',
          ),
        ),
      );

      final imageFinder = find.byType(Image);
      final backButtonFinder = find.byIcon(Icons.arrow_back_ios_new);

      expect(imageFinder, findsOneWidget);
      expect(backButtonFinder, findsOneWidget);
    });

    testWidgets('should navigate back when tapping the back button', (tester) async {
      final navigatorKey = GlobalKey<NavigatorState>();
      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigatorKey,
          home: BackgroundImage(
            size: 200,
            image: 'lib/images/house-cleaning.jpg',
          ),
        ),
      );

      final backButtonFinder = find.byIcon(Icons.arrow_back_ios_new);
      expect(backButtonFinder, findsOneWidget);

      await tester.tap(backButtonFinder);
      await tester.pumpAndSettle();

      expect(navigatorKey.currentState?.canPop(), isFalse);
    });
  });
}
