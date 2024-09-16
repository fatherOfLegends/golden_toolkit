import 'dart:async';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  // this intentionally shadows the more global setting so that we can validate how things work
  // without using GoldenToolkit.runWithConfiguration()
  await loadAppFonts();
  await testMain();
}
