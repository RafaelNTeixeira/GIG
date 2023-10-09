import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gig/components/buttons/side-bar.dart';
import 'package:gig/displays/login-page.dart';
import 'package:gig/displays/main-page.dart';
import 'package:gig/displays/profile-page.dart';


void main() {
  testWidgets('Renders the SideBarMenu widget', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SideBarMenu()));

    // Verify that the SideBarMenu widget is rendered
    expect(find.byType(SideBarMenu), findsOneWidget);
    expect(find.text('GIG MENU'), findsOneWidget);
    expect(find.byType(DrawerHeader), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(4));
  });
}