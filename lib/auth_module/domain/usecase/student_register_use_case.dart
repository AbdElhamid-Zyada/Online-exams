import 'package:dartz/dartz.dart';
import 'package:online_exams_system/auth_module/data/remote_data_source/remote_data_source.dart';
import 'package:online_exams_system/auth_module/domain/entity/functional_user.dart';
import 'package:online_exams_system/auth_module/domain/repo/base_auth_repo.dart';

import '../../../models/firebase_error_model.dart';
import '../../data/model/student_model.dart';

class StudentRegisterUseCase{
  BaseAuthRepo authRepo;

  StudentRegisterUseCase(this.authRepo);
  Future<Either<CustomFirebaseException, FunctionalUser>>execute(StudentModel student) async {
   return await authRepo.registerStudent(student);
  }


}