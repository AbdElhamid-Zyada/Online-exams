import 'package:dartz/dartz.dart';
import 'package:online_exams_system/prof_module/domain/repo/base_prof_repo.dart';

import '../../../models/course model.dart';
import '../../../models/firebase_error_model.dart';

class GetProfCoursesUseCase{
  BaseProfRepo profRepo;

  GetProfCoursesUseCase(this.profRepo);
  Future<Either<CustomFirebaseException, List<Course>>> execute(String profId)async{
    return await profRepo.getProfCourses(profId);
  }
}