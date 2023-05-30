import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class SharedPref {
  late SharedPreferences _sharedPreferences;

// add username and password to the shared preferences
  Future addUser({required User user}) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    // write whatever you want to store in the storage of phone using setString, setInt, setBool
    _sharedPreferences.setString('username', user.username);
    _sharedPreferences.setString('password', user.password);
    _sharedPreferences.setString('token', 'asdfFDF#3232');
  }

  // get usename and password from the shared preferences

  Future<User> getUser() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    final username = _sharedPreferences.getString('username');
    final password = _sharedPreferences.getString('password');

    // if found,  give username and password otherwise give ''
    return User(username: username ?? '', password: password ?? '');
  }
}
