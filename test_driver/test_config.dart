import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'steps/test_steps.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/**.feature")]
    ..reporters = [ProgressReporter()]
    ..stepDefinitions = [
      CheckGivenWidgets(),
      GivenInPage(),
      ExpectToBeInPage(),
      CheckLoggedInAPage()
    ]
    ..targetAppPath = "test_driver/app.dart";

  return GherkinRunner().execute(config);
}