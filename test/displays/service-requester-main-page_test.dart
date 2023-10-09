import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gig/displays/main-page.dart';
import 'package:gig/displays/service-provider-main-page.dart';
import 'package:gig/displays/service-requester-main-page.dart';

void main() {

  testWidgets('Displays ServiceRequesterMainPage for Service Requester', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ServiceRequesterMainPage(),
        ),
      );

      // Verify that the ServiceRequesterMainPage is displayed
      expect(find.byType(ServiceRequesterMainPage), findsOneWidget);
      expect(find.byType(ServiceProviderMainPage), findsNothing);
    });

}
