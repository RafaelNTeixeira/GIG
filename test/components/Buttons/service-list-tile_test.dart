import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gig/components/buttons/service-list-tile.dart';

void main() {
  testWidgets('ServiceListTile displays the correct information', (WidgetTester tester) async {
    const serviceName = 'Test Service';
    const description = 'A description of the test service.';
    const iconData = Icons.check;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ServiceListTile(
            serviceName: serviceName,
            description: description,
            icon: iconData,
          ),
        ),
      ),
    );

    // Find widgets
    final icon = find.byIcon(iconData);
    final name = find.text(serviceName);
    final desc = find.text(description);

    // Verify widgets are displayed
    expect(icon, findsOneWidget);
    expect(name, findsOneWidget);
    expect(desc, findsOneWidget);
  });

  testWidgets('ServiceListTile calls onPress callback when pressed', (WidgetTester tester) async {
    bool didPress = false;
    void handlePress() {
      didPress = true;
    }

    await tester.pumpWidget(
      MaterialApp(
        home: ServiceListTile(
          serviceName: 'Service Name',
          description: 'Service Description',
          onPress: handlePress,
          icon: Icons.settings,
        ),
      ),
    );

    final elevatedButton = find.byType(ElevatedButton);
    expect(elevatedButton, findsOneWidget);

    await tester.tap(elevatedButton);
    expect(didPress, isTrue);
  });
}
