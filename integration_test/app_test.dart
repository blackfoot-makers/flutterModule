import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:workshop_epitech/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the product add product to cart',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final Finder cartCount = find.byKey(const Key('cartCount'));

      expect(cartCount, findsOneWidget);

      // Verify the counter starts at 0.
      expect(
        find.descendant(of: cartCount, matching: find.text('0')),
        findsOneWidget,
      );

      // Finds the floating action button to tap on.
      final Finder firstProduct = find.byKey(const Key('Product 0'));

      // Emulate a tap
      await tester.tap(firstProduct);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Now we are on cart page, going back
      final Finder backButton = find.byTooltip('Back');
      // Emulate a tap
      await tester.tap(backButton);
      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(
        find.descendant(of: cartCount, matching: find.text('1')),
        findsOneWidget,
      );

      // Emulate a tap
      await tester.tap(firstProduct);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 0.
      expect(
        find.descendant(of: cartCount, matching: find.text('0')),
        findsOneWidget,
      );
    });
  });
}
