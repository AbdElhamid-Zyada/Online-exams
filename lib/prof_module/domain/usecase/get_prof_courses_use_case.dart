import 'package:dartz/dartz.dart';
import 'package:online_exams_system/prof_module/domain/repo/base_prof_repo.dart';

import '../../../models/firebase_error_model.dart';
import '../../../student_module/data/model/course_model.dart';

class GetProfCoursesUseCase{
  BaseProfRepo profRepo;

  GetProfCoursesUseCase(this.profRepo);
  Future<Either<CustomFirebaseException, List<CourseModel>>> execute(String profId)async{
    return await profRepo.getProfCourses(profId);
  }
}