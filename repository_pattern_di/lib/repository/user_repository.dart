// step 4

import '../data_source/local/local_data_source.dart';
import '../data_source/remote/remote_data_source.dart';
import '../model/user.dart';

// Note: Repository makes decision to send data where either in Local Data Source or Remote Data Source
// so we make two objects here
class UserRepository {
  // LocalDataSource localDataSource = LocalDataSource();
  // RemoteDataSource remoteDataSource = RemoteDataSource();
  LocalDataSource localDataSource;
  RemoteDataSource remoteDataSource;

  UserRepository(
      {required this.localDataSource, required this.remoteDataSource});

  // checking network avaiablae of rnot

  bool hasNetwork = false;

  bool addUser(User user) {
    bool isAdded = false;
    if (hasNetwork) {
      isAdded = remoteDataSource.addUser(user);
    } else {
      isAdded = localDataSource.addUser(user);
    }
    return isAdded;
  }

  List<User> getUsers() {
    if (hasNetwork) {
      return remoteDataSource.getUser();
    } else {
      return localDataSource.getUser();
    }
  }
}
