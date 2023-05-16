import 'package:dartz/dartz.dart';
import 'package:online_exams_system/models/course%20model.dart';
import 'package:online_exams_system/models/firebase_error_model.dart';

abstract class BaseProfRepo{
  Future<Either<CustomFirebaseException,List<Course>>>getProfCourses(String profId);
}