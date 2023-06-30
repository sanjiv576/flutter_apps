import 'dart:math';

class UserVerification {
  static final Random _random = Random();
  static int? _otp;

  static int _generateOtp() {
    int min = 0000;
    int max = 9999;
    _otp = min + _random.nextInt(max - min);
    return _otp!;
  }

// getter method only for retrieving otp code
  static int get getOtp => _generateOtp();

  static bool _checkOtp({required int otp}) => _otp == otp;

// setter method only for checking whether given otp code is correct or not
  static bool checkOtp({required int yourOTP}) => _checkOtp(otp: yourOTP);
}