// Step 1
class User {
  final int id;
  final String name;
  final String dob;
  final String birthTime;

  User(
      {required this.id,
      required this.name,
      required this.dob,
      required this.birthTime});

  @override
  String toString() => 'User(id: $id, name: $name)';
}
