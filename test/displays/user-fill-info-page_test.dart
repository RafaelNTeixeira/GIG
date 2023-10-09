import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gig/components/buttons/circular-avatar.dart';
import 'package:gig/components/buttons/side-bar.dart';
import 'package:gig/components/buttons/sign_up-button.dart';
import 'package:gig/components/fillers/text-field.dart';
import 'package:gig/displays/user-fill-info-page.dart';


void main() {
  final Widget testWidget = MaterialApp(
    home: FillUserInfoPage(uid: "1"),
  );

  testWidgets('Test if widgets are created on screen, when Service Requester is selected', (WidgetTester tester) async {
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(Expanded), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Column), findsNWidgets(2));
    expect(find.byType(CircularAvatar), findsOneWidget);
    expect(find.byType(BasicTextField), findsNWidgets(3));
    expect(find.byType(Text), findsNWidgets(8));
  });
}
