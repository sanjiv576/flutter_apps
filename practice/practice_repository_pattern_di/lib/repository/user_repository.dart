/*
Here, Repository makes decision to store data where.

If there is internet then, store/fetch data from Remote otherwise Local Data sources.
*/

import 'package:practice_repository_pattern_di/data_source/local/local_data_source.dart';
import 'package:practice_repository_pattern_di/data_source/remote/remote_data_source.dart';

import '../model/user.dart';

class UserRepository {
  /*
    since, UserRepository is dependent on Local and Remote  classes, so their objects are created  ==> this makes dependent 
  
   however, we make decision from outer class  (firebase, nodejs), so we do not create objects here at all.  ==> this inject dependency from outer class
   By creating objects, this does not make code testable when the size of application grows.
   So, we inject dependency in here from outer class by creating constructory and passing local and remote data sources.
   Note: Dependency injection is a techique that make class independent.
  */
  // LocalDataSource localDataSource = LocalDataSource();
  // RemoteDataSource remoteDataSource = RemoteDataSource();

  LocalDataSource localDataSource;
  RemoteDataSource remoteDataSource;

  UserRepository(
      {required this.localDataSource, required this.remoteDataSource});

  // check there is internet connectivity or not ===> for a while we use boolean value

  bool isNetwork = false;

  // store data or add user in Remote if there is internet , otherwise add in local
  bool addUser({required User user}) {
    if (isNetwork) {
      return remoteDataSource.addUser(user: user);
    } else {
      return localDataSource.addUser(user: user);
    }
  }

  // get data or get user from Remote if there is internet , otherwise from local

  List<User> getAllUsers() {
    if (isNetwork) {
      return remoteDataSource.getAllUsers();
    } else {
      return localDataSource.getAllUsers();
    }
  }
}
