import 'package:climb_logger/components/confirm_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("$ConfirmBack tests", () {
    testWidgets("Shows alert dialog when shouldPrompt is true", (tester) async {
      final widget = MaterialApp(
        home: Builder(builder: (context) {
          return ConfirmBack(
            shouldPrompt: true,
            dialogTitle: 'Test',
            child: Scaffold(
              body: TextButton(
                child: const Text("Back"),
                onPressed: () {
                  Navigator.of(context).maybePop();
                },
              ),
            ),
          );
        }),
      );

      await tester.pumpWidget(widget);
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
    });

    testWidgets("Does nothing when shouldPrompt is false", (tester) async {
      final widget = MaterialApp(
        home: Builder(builder: (context) {
          return ConfirmBack(
            shouldPrompt: false,
            dialogTitle: 'Test',
            child: Scaffold(
              body: TextButton(
                child: const Text("Back"),
                onPressed: () {
                  Navigator.of(context).maybePop();
                },
              ),
            ),
          );
        }),
      );

      await tester.pumpWidget(widget);
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
    });
  });
}
