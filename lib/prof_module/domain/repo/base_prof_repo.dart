import 'package:dartz/dartz.dart';
import 'package:online_exams_system/models/firebase_error_model.dart';

import '../../../student_module/data/model/course_model.dart';

abstract class BaseProfRepo{
  Future<Either<CustomFirebaseException,List<CourseModel>>>getProfCourses(String profId);
}