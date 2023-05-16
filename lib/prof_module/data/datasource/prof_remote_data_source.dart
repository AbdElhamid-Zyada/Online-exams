import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_exams_system/models/course%20model.dart';

import '../../../models/firebase_error_model.dart';
import '../../../models/level_model.dart';

abstract class BaseProfRemoteDataSource{
  Future<List<Course>>getProfCourses(String professorId);
}
class ProfRemoteDataSource implements BaseProfRemoteDataSource{

  @override
  Future<List<Course>> getProfCourses(String professorId) async {
    List<Course> professorCourses = [];

    try {
      // Query the departments collection in Firestore to retrieve all departments
      QuerySnapshot departmentsSnapshot =
      await FirebaseFirestore.instance.collection('departments').get();

      // Iterate over the departments and their levels to retrieve all courses taught by the professor
      for (QueryDocumentSnapshot departmentDoc in departmentsSnapshot.docs) {
        List<LevelModel> levels =
        (departmentDoc.get('levels') as List<dynamic>)
            .map((level) => LevelModel.fromJson(level))
            .toList();

        for (LevelModel level in levels) {
          List<Course> courses =
          (await FirebaseFirestore.instance
              .collection('departments')
              .doc(departmentDoc.id)
              .collection('levels')
              .doc(level.id)
              .collection('courses')
              .where('professor_id', isEqualTo: professorId)
              .get())
              .docs
              .map((doc) => Course.fromJson(doc.data()))
              .toList();

          professorCourses.addAll(courses);
        }
      }

      // Return the list of CourseModel objects
      return professorCourses;
    }  on FirebaseException catch (e) {
      throw CustomFirebaseException.fromFirebaseFirestoreException(e);
    } catch (e) {
      throw CustomFirebaseException("", 'An unexpected error occurred');
    }
  }

}