import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/core/failure/failure.dart';

import '../../data/repository/auth_remote_repository.dart';
import '../entity/student_entity.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  // check network connectivity if yes, read authRemoteRepositoryProvider , otherwise read authLocalRepositoryProvider
  // return ref.read(authLocalRepositoryProvider);
  return ref.read(authRemoteRepositoryProvider);
});

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerStudent(StudentEntity student);
  Future<Either<Failure, bool>> loginStudent(String username, String password);

  // step
  Future<Either<Failure, String>> uploadProfilePictre(File file);
}
