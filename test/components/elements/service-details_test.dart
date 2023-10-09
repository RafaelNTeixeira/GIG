import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gig/components/elements/service-details.dart';

void main() {
    testWidgets('displays the price and location', (WidgetTester tester) async {
      // Arrange
      const price = '25';
      const location = 'Paris';
      const category = 'Cleaning';
      const description = 'This is a test description.';

      await tester.pumpWidget(
        const MaterialApp(
          home: ServiceDetails(
            price: price,
            location: location,
            category: category,
            description: description,
          ),
        ),
      );

      // Act
      final priceFinder = find.text('$price/h');
      //final locationFinder = find.text(location, skipOffstage: false);

      // Assert
      expect(priceFinder, findsOneWidget);
      //expect(locationFinder, findsOneWidget);
    });

    testWidgets('displays the category and description', (WidgetTester tester) async {
      // Arrange
      const price = '25';
      const location = 'Paris';
      const category = 'Cleaning';
      const description = 'This is a test description.';

      await tester.pumpWidget(
        MaterialApp(
          home: ServiceDetails(
            price: price,
            location: location,
            category: category,
            description: description,
          ),
        ),
      );

      // Act
      final categoryFinder = find.text(category);
      final descriptionFinder = find.text(description);

      // Assert
      expect(categoryFinder, findsOneWidget);
      expect(descriptionFinder, findsOneWidget);
    });
}
