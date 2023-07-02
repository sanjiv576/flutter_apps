import 'package:flutter_test/flutter_test.dart';
import 'package:hive_and_api_for_class/features/arithmetic/arithmetic.dart';


/* 
Note: commands
1. flutter test test/unit_test/ --coverage ==> for generating coverage file

Note: add test_cov_console package before running step 2
2. flutter pub run test_cov_console ==> for showing coverage in console
*/
void main() {
  setUpAll(() {
    // creatte instance of arithmetic here

    // Note: setUpAll executes only once whereas Setup executes each time when the test case is executed

    // later on , we call services here
  });
  group('Arithmetic Operations', () {
    test('Add func', () {
      //
      int actualValue = Arithmetic.add(first: 3, second: 2);
      int expectedValue = 5;

// acutal value (return value from function), expected(correct value)

      expect(actualValue, expectedValue);
    });

    test('Subtract func', () {
      //
      int actualValue = Arithmetic.sub(first: 3, second: 2);
      int expectedValue = 1;

// acutal value (return value from function), expected(correct value)
      expect(actualValue, expectedValue);
    });

    test('Multiply function', () {
      int acutalValue = Arithmetic.mul(first: 4, second: 2);
      expect(acutalValue, 8);
    });

    test('Divivde function', () {
      expect(Arithmetic.div(first: 10, second: 5), 2);
    });
  });
}
