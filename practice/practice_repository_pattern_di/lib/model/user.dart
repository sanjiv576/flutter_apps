class User {
  final String name;
  final int age;
  final int id;

  User({required this.id, required this.age, required this.name});

  @override
  String toString() {
    return 'Id: $id, Name: $name, Age: $age';
  }
}
