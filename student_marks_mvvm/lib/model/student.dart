class Student {
  final String firstName;
  final String lastName;

  final String module;
  final double marks;

  Student({
    required this.firstName,
    required this.lastName,
    required this.module,
    required this.marks,
  });

  @override
  String toString() {
    return 'First Name: $firstName\nLast Name: $lastName\nModule: $module\nMarks: $marks';
  }
}
