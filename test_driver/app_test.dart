import 'package:flutter/foundation.dart';
import 'package:flutter_app/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Todo app', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    final buttonFinder = find.byKey(const Key('goToTaskPageButton'));

    await Future.delayed(const Duration(seconds: 2));
    // First, tap the button.
    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();
    expect(find.text("0 Tasks"), findsOneWidget);
    await Future.delayed(const Duration(seconds: 2));
  });
}
