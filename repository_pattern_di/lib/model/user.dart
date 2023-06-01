// Step 1
class User {
  final int id;
  final String name;
  final int age;

  User({required this.id, required this.name, required this.age});

  @override
  String toString() => 'User(id: $id, name: $name)';
}
