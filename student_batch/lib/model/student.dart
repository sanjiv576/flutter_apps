import 'package:uuid/uuid.dart';

class Student {
  final String? studentId;
  final String? fname;
  final String? lname;
  final int? age;
  final String? gender;
  final String? username;
  final String? password;
  final String? batchId;

  Student({
    String? studentId,
    required this.fname,
    required this.lname,
    required this.age,
    required this.gender,
    required this.username,
    required this.password,
    required this.batchId,
  }) : studentId = studentId ?? const Uuid().v4.toString();
}
