import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gig/components/buttons/sign_up-button.dart';
import 'package:gig/components/elements/background-image.dart';
import 'package:gig/components/elements/service-details.dart';
import 'package:gig/displays/service-details-page.dart';
import 'package:gig/displays/submit-offer-page.dart';
import 'package:gig/model/user.dart';

void main() {
  testWidgets('ServiceDetailsPage renders correctly', (WidgetTester tester) async {
    final worker = AppUser(
      paymentHour: '20',
      location: 'New York',
      workDescription: 'Experienced worker', id: '123', uid: '123',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: ServiceDetailsPage(
          worker: worker,
          image: 'lib/images/avatar.jpg',
          serviceType: 'Cleaning',
        ),
      ),
    );

    expect(find.byType(BackgroundImage), findsOneWidget);
    expect(find.byType(ServiceDetails), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Create Offer'), findsOneWidget);

  });


}
