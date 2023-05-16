import 'package:dartz/dartz.dart';
import 'package:online_exams_system/models/course%20model.dart';
import 'package:online_exams_system/models/firebase_error_model.dart';
import 'package:online_exams_system/prof_module/data/datasource/prof_remote_data_source.dart';

import '../../domain/repo/base_prof_repo.dart';

class ProfRepo implements BaseProfRepo{
  BaseProfRemoteDataSource profRemoteDataSource;

  ProfRepo(this.profRemoteDataSource);

  @override
  Future<Either<CustomFirebaseException, List<Course>>> getProfCourses(String profId) async {
    try {
      final departments=await profRemoteDataSource.getProfCourses( profId );
      return Right(departments);


    } on CustomFirebaseException catch (e) {
      return Left(CustomFirebaseException(e.code,e.message.toString()));
    }
  }
}