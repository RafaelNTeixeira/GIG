import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gig/displays/display-worker-info-page.dart';
import 'package:gig/model/user.dart';


void main() {
  testWidgets('DisplayWorkerInfoPage UI Test', (WidgetTester tester) async {
    // Create a mock worker object for testing
    final worker = AppUser(name: 'John Doe', age: '30', biography: 'Lorem ipsum', location: 'City', paymentHour: '20', id: '1', uid: '1');

    // Build the DisplayWorkerInfoPage widget
    await tester.pumpWidget(
      MaterialApp(
        home: DisplayWorkerInfoPage(worker: worker),
      ),
    );

    // Verify that the worker's name is displayed correctly
    expect(find.text('John Doe'), findsOneWidget);

    // Verify other expected widgets based on your widget code
    expect(find.text('A G E \n30'), findsOneWidget);
    expect(find.text('B I O G R A P H Y \nLorem ipsum'), findsOneWidget);
    expect(find.text('L O C A T I O N \nCity'), findsOneWidget);
    expect(find.text('P A Y M E N T / H O U R \n\$ 20/h'), findsOneWidget);
  });
}
