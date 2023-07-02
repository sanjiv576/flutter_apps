import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_and_api_for_class/features/arithmetic/arithmetic_view.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  // launch all necessry things before exectuting integration test
  IntegrationTestWidgetsFlutterBinding
      .ensureInitialized(); // use this only for Integration testing

  testWidgets('subtract with numbers by doing integration testing',
      (tester) async {
    // build the material app
    await tester.pumpWidget(
      const MaterialApp(
        home: ArithmeticView(),
      ),
    );

    // find textform fields and insert values
    await tester.enterText(find.byType(TextFormField).at(0), '9');
    await tester.enterText(find.byType(TextFormField).at(1), '6');

    // click on the button
    await tester.tap(find.widgetWithText(ElevatedButton, 'Subtract'));
    expect(find.text('Result : 3'), findsOneWidget);
  });
}
