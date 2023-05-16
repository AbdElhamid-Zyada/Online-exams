import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/src/firebase_auth_exception.dart';
import 'package:online_exams_system/auth_module/data/model/login_model.dart';
import 'package:online_exams_system/auth_module/data/model/student_model.dart';
import 'package:online_exams_system/auth_module/data/remote_data_source/remote_data_source.dart';
import 'package:online_exams_system/auth_module/domain/entity/functional_user.dart';
import 'package:online_exams_system/auth_module/domain/repo/base_auth_repo.dart';
import 'package:online_exams_system/models/department_model.dart';
import 'package:online_exams_system/models/level_model.dart';

import '../../../models/firebase_error_model.dart';
import '../../domain/entity/user.dart';

class AuthRepo extends BaseAuthRepo {
  AuthRemoteDataSource remoteDataSource;

  AuthRepo(this.remoteDataSource);

  @override
  Future<Either<CustomFirebaseException, FunctionalUser>> registerStudent(StudentModel user)async {
    try {
      final student=await remoteDataSource.registerStudent(user);
      return Right(student);


    } on CustomFirebaseException catch (e) {
      return Left(CustomFirebaseException(e.code,e.message.toString()));
    }
  }

  @override
  Future<Either<CustomFirebaseException, FunctionalUser>> registerProf(FunctionalUser user) async {
    try {
      final prof=await remoteDataSource.registerProf(user);
      return Right(prof);


    } on CustomFirebaseException catch (e) {
      return Left(CustomFirebaseException(e.code,e.message.toString()));
    }
  }

  @override
  Future<Either<CustomFirebaseException, LocalUser>> login(LoginModel loginModel) async {

    try {
      final functionUser=await remoteDataSource.login(loginModel  );
      return Right(functionUser);


    } on CustomFirebaseException catch (e) {
      return Left(CustomFirebaseException(e.code,e.message.toString()));
    }
  }

  @override
  Future<Either<CustomFirebaseException, List<DepartmentModel>>> getDepartments() async {
    try {
      final departments=await remoteDataSource.getDepartments(  );
      return Right(departments);


    } on CustomFirebaseException catch (e) {
      return Left(CustomFirebaseException(e.code,e.message.toString()));
    }
  }

  @override
  Future<Either<CustomFirebaseException, List<LevelModel>>> getLevels() async {
    try {
      final levels=await remoteDataSource.getLevels(  );
      return Right(levels);


    } on CustomFirebaseException catch (e) {
      return Left(CustomFirebaseException(e.code,e.message.toString()));
    }
  }
}
