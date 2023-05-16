import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_exams_system/models/department_model.dart';
import 'package:online_exams_system/models/firebase_error_model.dart';
import 'package:online_exams_system/models/level_model.dart';

import '../../data/model/login_model.dart';
import '../../data/model/student_model.dart';
import '../entity/functional_user.dart';
import '../entity/user.dart';

abstract class BaseAuthRepo{
  Future<Either<CustomFirebaseException,FunctionalUser >>registerStudent(StudentModel user);
  Future<Either<CustomFirebaseException,FunctionalUser >>registerProf(FunctionalUser user);
  Future<Either<CustomFirebaseException,LocalUser >>login(LoginModel loginModel);
  Future<Either<CustomFirebaseException,List<LevelModel> >> getLevels( );
  Future<Either<CustomFirebaseException,List<DepartmentModel> >> getDepartments( );
}