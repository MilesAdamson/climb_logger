import 'package:flutter_test/flutter_test.dart';

Future<void> scrollUntilFound(
  WidgetTester tester,
  Finder finder, {
  int attempts = 20,
}) async {
  for (int i = 1; i <= attempts; i++) {
    final gesture = await tester.startGesture(const Offset(0, 300));
    await gesture.moveBy(const Offset(0, -300));
    await tester.pump();

    try {
      expect(finder, findsOneWidget);
      await tester.pumpAndSettle();
      return;
    } catch (e) {
      if (i == attempts) {
        rethrow;
      }
    }
  }
}
