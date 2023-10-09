import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gig/components/buttons/circular-avatar.dart';

void main() {
    const String imagePath = 'lib/images/avatar.jpg';
    const double imageRadius = 50.0;

    testWidgets('CircularAvatar displays image correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CircularAvatar(
            image: imagePath,
            image_radius: imageRadius,
          ),
        ),
      );

      final CircleAvatar circleAvatar = tester.widget<CircleAvatar>(find.byType(CircleAvatar).first);

      expect(circleAvatar.backgroundColor, equals(Colors.white));
      expect(circleAvatar.radius, equals(imageRadius));

      final CircleAvatar imageAvatar = circleAvatar.child as CircleAvatar;
      expect(imageAvatar.backgroundColor, equals(Colors.grey.shade100));
      expect(imageAvatar.radius, equals(imageRadius - 1.0));
      expect(imageAvatar.backgroundImage, equals(const AssetImage(imagePath)));
    });

    testWidgets('onPress is called when the avatar is tapped', (WidgetTester tester) async {
      var pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CircularAvatar(
              image: imagePath,
              image_radius: imageRadius,
              onPress: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      // Tap the gesture detector to trigger the onPress callback
      final gestureDetector = find.byType(GestureDetector);
      await tester.tap(gestureDetector);
      await tester.pump();

      // Verify that the onPress callback was called
      expect(pressed, isTrue);
    });
}
