import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../failure/failure.dart';

final userSharedPrefsProvider =
    Provider<UserSharedPrefs>((ref) => UserSharedPrefs());

class UserSharedPrefs {
  late SharedPreferences _sharedPreferences;

  // set user token

  Future<Either<Failure, bool>> setUserToken(String token) async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.setString('token', token);

      return right(true);
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }

  // get user token

  Future<Either<Failure, String>> getUserToken() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      final token = _sharedPreferences.getString('token');
      return right(token.toString());
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }
}
