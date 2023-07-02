import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_and_api_for_class/features/arithmetic/arithmetic_view.dart';

void main() {
  // testWidgets function allows you to define a widget test and creates a WidgetTester to work with.
  //  WidgetTester i.e tester allows you to build and interact with widgets in the test environment.

  testWidgets('check title of app bar of arithmetic view', (tester) async {
    // Step 1: build the widget and also launch the Material App
// Note: pumpWidget() ==> builds the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: ArithmeticView(),
      ),
    );

    // Step 2: wait until it is completed
    await tester.pumpAndSettle();

    // Step 3 : Search for our widget using a Finder
    Finder expectedValue = find.text('Arithmetic Operations');

    // Step 4: Verify the widget using a Matcher
    expect(expectedValue,
        findsOneWidget); // findsOneWidget ==> finds only one widget
  });

  testWidgets('add two number with user actions', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ArithmeticView(),
      ),
    );

// method - 1
    // Step 1: first find the text form field at 0 index
    Finder firstTextFormField = find.byType(TextFormField).at(0);
    // Step 2: enter first number value as 3 assuming by user action
    await tester.enterText(firstTextFormField, '3');

    // again, find second textformfield at 1 index and enter value as 12
    await tester.enterText(
        find.byType(TextFormField).at(1), '12'); // method - 2

    // Step 3: click/tap on the button
    // method - 1 by button name
    // await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));

    // method - 2 by index of button
    await tester.tap(find.byType(ElevatedButton).at(0));

    // Step 4 : wait to rebuild after setState that is triggered after tapping on the button
    await tester.pumpAndSettle(); // use this when setState takes place

    // Step 5: verify the widget using a matcher i.e Result : 15 ==> which is displayed in the screen
    expect(find.text('Result : 15'), findsOneWidget);
  });
}
