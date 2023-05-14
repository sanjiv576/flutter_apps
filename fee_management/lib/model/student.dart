class Student {
  int? studentId;
  String? fname;
  String? lname;
  int? age;
  String? gender;
  double? dueAmount;
  String? username;
  String? password;

  Student(
      {required this.fname,
      required this.lname,
      required this.age,
      required this.gender,
      required this.dueAmount,
      required this.username,
      required this.password,
      required this.studentId});
}
