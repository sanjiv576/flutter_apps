import 'course.dart';

class Student {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String batch;
  final List<Course> course;
  final String username;
  final String password;

  Student({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.batch,
    required this.course,
    required this.username,
    required this.password,
  });
}
