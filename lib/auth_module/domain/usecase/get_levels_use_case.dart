
import 'package:dartz/dartz.dart';
import 'package:online_exams_system/auth_module/data/model/login_model.dart';
import 'package:online_exams_system/auth_module/data/remote_data_source/remote_data_source.dart';
import 'package:online_exams_system/auth_module/domain/entity/functional_user.dart';
import 'package:online_exams_system/auth_module/domain/repo/base_auth_repo.dart';
import 'package:online_exams_system/student_module/data/model/level_model.dart';

import '../../../models/firebase_error_model.dart';
import '../entity/user.dart';

class GetLevelsUseCase{
  BaseAuthRepo authRepo;

  GetLevelsUseCase(this.authRepo);
  Future<Either<CustomFirebaseException, List<LevelModel>>>execute() async {
    return await authRepo.getLevels();
  }


}