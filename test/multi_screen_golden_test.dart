import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> main() async {
  group('Multi Screen Golden examples', () {
    group('Responsive layout when image changes depending on layout', () {
      testGoldens('Safe Area test', (tester) async {
        await tester.pumpWidgetBuilder(
          Container(
              color: Colors.white,
              child: SafeArea(child: Container(color: Colors.blue))),
        );
        await multiScreenGolden(
          tester,
          'safe_area',
          devices: [
            const Device(
              name: 'no_safe_area',
              size: Size(200, 200),
            ),
            const Device(
              name: 'safe_area',
              size: Size(200, 200),
              safeArea: EdgeInsets.fromLTRB(5, 10, 15, 20),
            )
          ],
        );
      });

      testGoldens('Platform Brightness Test', (tester) async {
        await tester.pumpWidgetBuilder(
          Builder(
            builder: (context) => Container(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Colors.grey
                      : Colors.white,
              child: Text(MediaQuery.of(context).platformBrightness.toString()),
            ),
          ),
        );
        await multiScreenGolden(
          tester,
          'brightness',
          devices: [
            const Device(
              name: 'light',
              size: Size(200, 200),
              brightness: Brightness.light,
            ),
            const Device(
              name: 'dark',
              size: Size(200, 200),
              brightness: Brightness.dark,
            )
          ],
        );
      });

      testGoldens('Should restore window binding settings', (tester) async {
        final initialSize = tester.view.physicalSize;
        final initialBrightness = tester.platformDispatcher.platformBrightness;
        final initialDevicePixelRatio = tester.view.devicePixelRatio;
        final initialTextScaleFactor =
            tester.platformDispatcher.textScaleFactor;
        final initialViewInsets = tester.view.padding;

        await tester.pumpWidgetBuilder(Container());
        await multiScreenGolden(
          tester,
          'empty',
          devices: [
            const Device(
              name: 'anything',
              size: Size(50, 75),
              brightness: Brightness.light,
              safeArea: EdgeInsets.all(4),
              devicePixelRatio: 2.0,
              textScale: 1.5,
            )
          ],
        );

        expect(tester.view.physicalSize, equals(initialSize));
        expect(tester.platformDispatcher.platformBrightness,
            equals(initialBrightness));
        expect(tester.view.devicePixelRatio, equals(initialDevicePixelRatio));
        expect(tester.platformDispatcher.textScaleFactor,
            equals(initialTextScaleFactor));
        expect(tester.view.padding, equals(initialViewInsets));
      });

      testGoldens('Maintain physical size in pumped widget', (tester) async {
        bool firstPump = true;
        const defaultSize = Size(800, 600);
        const desiredSize = Size(50, 75);
        await tester.pumpWidgetBuilder(StreamBuilder(
          builder: (context, _) {
            if (firstPump) {
              expect(MediaQuery.of(context).size, equals(defaultSize));
              firstPump = false;
            } else {
              expect(MediaQuery.of(context).size, equals(desiredSize));
            }
            return const Text('Done');
          },
          stream: Stream.value(null),
        ));
        await multiScreenGolden(
          tester,
          'desiredSize',
          devices: [
            const Device(
              name: 'anything',
              size: desiredSize,
              brightness: Brightness.light,
              safeArea: EdgeInsets.all(4),
              devicePixelRatio: 2.0,
              textScale: 1.0,
            )
          ],
        );
      });

      testGoldens('Should expand scrollable if autoHeight is true',
          (tester) async {
        await tester.pumpWidgetBuilder(ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.black.withRed(255 - index * 5),
              height: 50,
            );
          },
          itemCount: 40,
        ));

        await multiScreenGolden(
          tester,
          'auto_height_list_view',
          autoHeight: true,
          devices: [
            const Device(
              name: 'anything',
              size: Size(100, 200),
              brightness: Brightness.light,
            )
          ],
        );
      });

      testGoldens('Should expand scrollable only if not infinite',
          (tester) async {
        await tester.pumpWidgetBuilder(ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.black.withRed(255 - index * 5),
              height: 50,
            );
          },
        ));

        await multiScreenGolden(
          tester,
          'auto_height_infinite_list_view',
          autoHeight: true,
          devices: [
            const Device(
              name: 'anything',
              size: Size(100, 200),
              brightness: Brightness.light,
            )
          ],
        );
      });

      testGoldens('Should shrink to finders height if autoHeight is true',
          (tester) async {
        await tester.pumpWidget(Center(
          // We center here so the Container is not forced to go full height
          child: Container(color: Colors.red, height: 50),
        ));

        await multiScreenGolden(
          tester,
          'auto_height_shrink',
          autoHeight: true,
          finder: find.byType(ColoredBox),
          devices: [
            const Device(
              name: 'anything',
              size: Size(100, 200),
              brightness: Brightness.light,
            )
          ],
        );
      });

      testGoldens('Should set to exact height if override height is specified',
          (tester) async {
        await tester.pumpWidget(Center(
          // We center here so the Container is not forced to go full height
          child: Container(color: Colors.red, height: 50),
        ));

        await multiScreenGolden(
          tester,
          'override_height',
          overrideGoldenHeight: 300,
          devices: [
            const Device(
              name: 'anything',
              size: Size(100, 200),
              brightness: Brightness.light,
            )
          ],
        );
      });
    });
  });
}
