// import 'dart:io';

// void main() {
//   print('Enter id');
//   int id = int.parse(stdin.readLineSync()!);

//   print('Enter name');
//   String name = stdin.readLineSync()!;

//   print('Enter age');
//   int age = int.parse(stdin.readLineSync()!);

//   print('id : $id, name: $name');
// }

import 'package:repository_pattern_di/model/user.dart';

import '../di/di.dart';
import '../repository/user_repository.dart';

void main() {
  // Load di module
  initModule();
  User user = User(
    id: 1,
    name: 'John Doe',
    age: 30,
  );

  // UserRepository userRepository = UserRepository();
  // Get the UserRepository instance from GetIt
  UserRepository userRepository = getIt<UserRepository>();

  if (userRepository.addUser(user)) {
    print('User added successfully');
  } else {
    print('User not added');
  }
}
