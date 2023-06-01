/*
Here, we create just a single instantiate of Local and Remote Data sources 
 using get_it dart lib for less memory consumption.


Note: 

registerLazySingleton() ==> its object is not created until this (i.e registerLazySingleton() ) function is called
registerSingleton() ==> its object is created when the initModule() function is called

*/

import 'package:get_it/get_it.dart';
import 'package:practice_repository_pattern_di/data_source/local/local_data_source.dart';
import 'package:practice_repository_pattern_di/data_source/remote/remote_data_source.dart';
import 'package:practice_repository_pattern_di/repository/user_repository.dart';

// making global variable of get_it for Singleton (creating a single object)
final getIt = GetIt.instance;

// this function creates a single object of Local and Remote data sources
// make objects inside this function
void initModule() {
  // Note: UserRepositry is a child of Local and Remote, so object of UserRepository is made at last

  // assume father
  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource());

  // assume mother
  getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSource());

  // child

  getIt.registerLazySingleton(
    () => UserRepository(
      // note; getIt() finds respective instances
      localDataSource:
          getIt(), // LocalDataSource() can be used but it makes multiple objects, so getIt() is used for Singleton
      remoteDataSource:
          getIt(), // RemoteDataSource() can be used but it makes multiple objects, so getIt() is used for Singleton
    ),
  );
}
