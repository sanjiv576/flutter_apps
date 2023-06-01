import 'package:practice_repository_pattern_di/di/di.dart';
import 'package:practice_repository_pattern_di/model/user.dart';
import 'package:practice_repository_pattern_di/repository/user_repository.dart';

void main() {
  User user = User(id: 12, age: 32, name: 'Peter');
  initModule();

  // get instance that already created in the GetIt instance
  UserRepository userRepository = getIt<UserRepository>();

  userRepository.addUser(user: user);

  // display all users
  print(userRepository.getAllUsers());
}
