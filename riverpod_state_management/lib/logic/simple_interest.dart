import 'package:flutter_riverpod/flutter_riverpod.dart';

final simpleInterestProvider =
    Provider<SimpleInterest>((ref) => SimpleInterest());

class SimpleInterest {
  double calculate(
          {required double principal,
          required double time,
          required double rate}) =>
      principal * time * rate / 100;
}
