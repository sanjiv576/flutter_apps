class Student {
  final String firstName;
  final String lastName;
  final String dob;

  Student({required this.firstName, required this.lastName, required this.dob});

  @override
  String toString() {
    return 'First Name: $firstName ';
  }
}
