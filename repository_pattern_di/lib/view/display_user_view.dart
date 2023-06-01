// import 'package:repository_pattern_di/repository/user_repository.dart';

// void main() {
//   initModule();
//   UserRepository userRepository = UserRepository();
//   print(userRepository.getUsers());

//   print(getIt<>)
// }



import '../di/di.dart';
import '../repository/user_repository.dart';

void main() {
  // Load di module
  initModule();
  UserRepository userRepository = getIt<UserRepository>();
  print(userRepository.getUsers());
}