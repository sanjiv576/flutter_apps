import 'package:practice_repository_pattern_di/di/di.dart';

import '../data_source/local/local_data_source.dart';
import '../data_source/remote/remote_data_source.dart';
import '../model/user.dart';
import '../repository/user_repository.dart';

void main() {
  // DO NOT create objects directly from UserRepository
  // UserRepository userRepository = UserRepository(
  //   localDataSource: LocalDataSource(),
  //   remoteDataSource: RemoteDataSource()
  // );

  // use this rather than above code

  initModule(); // call the function to get instance of UserRepository  ==> inside di.dart file
  UserRepository userRepository = getIt<UserRepository>();    // get a single instance of UserRepository that already created in GetIt instance from di.dart file

// if there is Internet the data come from Remote otherwise Local
  List<User> users = userRepository.getAllUsers();

  print(users);
}
