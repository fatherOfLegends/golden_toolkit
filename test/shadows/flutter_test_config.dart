import 'dart:async';
import 'dart:io';

import 'package:golden_toolkit_fol_edition/golden_toolkit.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      await testMain();
    },
    config: GoldenToolkitConfiguration(
      // Currently, goldens are not generated/validated in CI for this repo. We have settled on the goldens for this package
      // being captured/validated by developers running on MacOSX. We may revisit this in the future if there is a reason to invest
      // in more sophistication
      skipGoldenAssertion: () => !Platform.isMacOS,
      // enableRealShadows can only work when "outside" of a `testGoldens` , for instance here at the root
      enableRealShadows: true,
    ),
  );
}
