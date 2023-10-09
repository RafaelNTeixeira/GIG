import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gig/displays/about-page.dart';

void main() {
  testWidgets('AboutPage UI Test', (WidgetTester tester) async {
    // Build the AboutPage widget
    await tester.pumpWidget(MaterialApp(home: AboutPage()));

    // Verify that the AboutPage UI is rendered correctly
    expect(find.text("A B O U T   G I G"), findsOneWidget);
    expect(find.text("GIG was created in the hope of helping people's daily problems in a more efficient and simple way.\n"
        "With a few touches, we can get someone with experience to solve your problems at a place of your own preference"), findsOneWidget);
    expect(find.text("OUR CORE VALUES"), findsOneWidget);
    expect(find.byIcon(Icons.groups), findsOneWidget);
    expect(find.byIcon(Icons.business_center_rounded), findsOneWidget);
    expect(find.byIcon(Icons.signal_cellular_alt_outlined), findsOneWidget);
    expect(find.text("Authentically serve our customers by empowering, listening, and collaborating with our fellow users"), findsOneWidget);
    expect(find.text("Deliver the best service possible. Making our customers happy is our highest priority"), findsOneWidget);
    expect(find.text("Adopt a Growth Mindset. Be curious and eager to learn. Aim for ethical, sustainable, long-term growth"), findsOneWidget);
    expect(find.text("D E V E L O P E R S"), findsOneWidget);
  });
}
