

import '../data_source/local/local_data_source.dart';
import '../data_source/remote/remote_data_source.dart';
import '../model/user.dart';
import '../repository/user_repository.dart';

void main() {
  UserRepository userRepository = UserRepository(
    localDataSource: LocalDataSource(),
    remoteDataSource: RemoteDataSource()
  );

// if there is Internet the data come from Remote otherwise Local
  List<User> users = userRepository.getAllUsers();

  print(users);
}
