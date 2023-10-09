import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gig/components/buttons/worker-select.dart';
import 'package:gig/model/user.dart';

void main() {
  testWidgets(
    'WorkerSelect displays avatar and name',
        (WidgetTester tester) async {
      // Create a dummy AppUser object
      final appUser = AppUser(
        id: '1',
        name: 'John Doe',
        email: 'johndoe@example.com',
        age: '25',
        location: 'New York',
        workDescription: 'Software Developer',
        biography: 'Experienced developer with a passion for creating amazing apps.',
        uid: 'user_123',
        service: 'App Development',
        paymentHour: '30 USD',
        tasks: {
          'task1': {
            'title': 'Task 1',
            'status': 'Pending',
          },
          'task2': {
            'title': 'Task 2',
            'status': 'Completed',
          },
        },
        offers: {
          'offer1': {
            'title': 'Offer 1',
            'status': 'Accepted',
          },
          'offer2': {
            'title': 'Offer 2',
            'status': 'Declined',
          },
        },
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Container(
                height: 200, // Adjust the height according to your needs
                child: WorkerSelect(
                  image: 'lib/images/google.png',
                  name: 'John Doe', // Provide the name
                  nameStyle: TextStyle(fontSize: 16), // Provide the name style
                  worker: appUser,
                  serviceType: '',
                ),
              ),
            ),
          ),
        ),
      );

      // Verify that exactly one avatar is displayed
      expect(find.byType(CircleAvatar), findsWidgets);

      // Verify that the name is displayed
      expect(find.text('John Doe'), findsOneWidget);
    },
  );
}

// A dummy ServiceDetailsPage widget for testing purposes
class ServiceDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
