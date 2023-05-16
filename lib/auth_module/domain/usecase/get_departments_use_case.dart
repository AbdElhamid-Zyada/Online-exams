
import 'package:dartz/dartz.dart';
import 'package:online_exams_system/auth_module/data/model/login_model.dart';
import 'package:online_exams_system/auth_module/data/remote_data_source/remote_data_source.dart';
import 'package:online_exams_system/auth_module/domain/entity/functional_user.dart';
import 'package:online_exams_system/auth_module/domain/repo/base_auth_repo.dart';
import 'package:online_exams_system/models/department_model.dart';
import 'package:online_exams_system/models/level_model.dart';

import '../../../models/firebase_error_model.dart';
import '../entity/user.dart';

class GetDepartmentsUseCase{
  BaseAuthRepo authRepo;

  GetDepartmentsUseCase(this.authRepo);
  Future<Either<CustomFirebaseException, List<DepartmentModel>>>execute() async {
    return await authRepo.getDepartments();
  }


}