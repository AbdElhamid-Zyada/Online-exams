import 'dart:convert';
import 'dart:developer';
import 'package:online_exams_system/models/department_model.dart';
import 'package:online_exams_system/student_module/data/model/chapter_model.dart';
import 'package:online_exams_system/student_module/data/model/course_model.dart';
import 'package:online_exams_system/student_module/data/model/exam_model.dart';
import 'package:online_exams_system/student_module/data/model/exam_result.dart';
import 'package:online_exams_system/student_module/data/model/exam_standard_model.dart';
import 'package:online_exams_system/student_module/data/model/option_model.dart';
import 'package:online_exams_system/student_module/data/model/question_model.dart';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_exams_system/auth_module/data/model/login_model.dart';
import 'package:online_exams_system/auth_module/data/model/professor_model.dart';
import 'package:online_exams_system/auth_module/domain/entity/functional_user.dart';
import 'package:online_exams_system/auth_module/domain/entity/user.dart';
import 'package:online_exams_system/models/department_model.dart';
import 'package:online_exams_system/student_module/data/model/level_model.dart';

import '../../../models/firebase_error_model.dart';
import '../../../shared/app_constants.dart';
import '../../../student_module/data/model/chapter_model.dart';
import '../../../student_module/data/model/course_model.dart';
import '../model/admin_user_model.dart';
import '../model/student_model.dart';

abstract class BaseAuthRemoteDataSource {
  Future<FunctionalUser> registerStudent(StudentModel user);

  Future<FunctionalUser> registerProf(FunctionalUser user);

  Future<LocalUser> login(LoginModel user);

  Future<List<LevelModel>> getLevels();

  Future<List<DepartmentModel>> getDepartments();
}

class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<StudentModel> registerStudent(StudentModel user) async {
    try {
      // Create user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      // Store other information in Firestore collection
      await _firestore
          .collection('students')
          .doc(userCredential.user!.uid)
          .set({
        'name': user.name,
        'email': user.email,
        'courses': [],
        "level": user.levelModel.toJson(),
        "department": user.departmentModel.toJson()
      });

      // Return the created user object
      return StudentModel(
        id: userCredential.user!.uid,
        name: user.name,
        email: user.email,
        password: user.password,
        courses: user.courses,
        departmentModel: user.departmentModel,
        levelModel: user.levelModel,
      );
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseException.fromFirebaseAuthException(e);
    } on FirebaseException catch (e) {
      throw CustomFirebaseException.fromFirebaseFirestoreException(e);
    } catch (e) {
      throw CustomFirebaseException("", 'An unexpected error occurred');
    }
  }

  @override
  Future<FunctionalUser> registerProf(FunctionalUser user) async {
    try {
      // Create user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      // Store other information in Firestore collection
      await _firestore
          .collection('professors')
          .doc(userCredential.user!.uid)
          .set({
        'name': user.name,
        'email': user.email,
        'courses': [],
      });

      // Return the created user object
      return ProfessorModel(
        id: userCredential.user!.uid,
        name: user.name,
        email: user.email,
        password: user.password,
        courses: user.courses,
      );
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseException.fromFirebaseAuthException(e);
    } on FirebaseException catch (e) {
      throw CustomFirebaseException.fromFirebaseFirestoreException(e);
    } catch (e) {
      throw CustomFirebaseException("", 'An unexpected error occurred');
    }
  }

  @override
  Future<LocalUser> login(LoginModel loginModel) async {
    try {
      // Sign in the user with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      );

      // Retrieve the user's data from the professors collection
      DocumentSnapshot userSnapshot = await _firestore
          .collection('professors')
          .doc(userCredential.user!.uid)
          .get();

      // If the user is not found in the professors collection, retrieve the user's data from the students collection
      if (!userSnapshot.exists) {
        userSnapshot = await _firestore
            .collection('students')
            .doc(userCredential.user!.uid)
            .get();
      }

      // If the user is not found in either collection, retrieve the user's data from the admins collection
      if (!userSnapshot.exists) {
        userSnapshot = await _firestore
            .collection('admins')
            .doc(userCredential.user!.uid)
            .get();
      }

      // If the user is not found in any collection, throw a custom FirebaseException object
      if (!userSnapshot.exists) {
        throw CustomFirebaseException(
            'user-not-found', 'The user does not exist.');
      }

      // Check if the user is a student, professor, or admin based on the collection from which the user's data was retrieved.
      String collectionName = userSnapshot.reference.parent.id;
      LocalUser localUser;
      if (collectionName == 'students') {
        localUser =
            StudentModel.fromJson(userSnapshot.data() as Map<String, dynamic>);
      } else if (collectionName == 'professors') {
        localUser = ProfessorModel.fromJson(
            userSnapshot.data() as Map<String, dynamic>);
      } else if (collectionName == 'admins') {
        localUser =
            AdminModel.fromJson(userSnapshot.data() as Map<String, dynamic>);
      } else {
        throw CustomFirebaseException(
            'unknown-user-type', 'Unknown user type.');
      }

      return localUser;
    } on FirebaseAuthException catch (e) {
      // Sign-in failed, throw a custom FirebaseException object
      throw CustomFirebaseException(
          e.code, e.message ?? 'An unexpected error occurred');
    } catch (e) {
      log(e.toString());
      throw CustomFirebaseException("", 'An unexpected error occurred');
    }
  }

  @override
  Future<List<DepartmentModel>> getDepartments() async {
    try {
      DepartmentModel departmentModel =
      DepartmentModel(id: "asdasdfjkasdfjksdahfg", title: "CS", levels: [
        LevelModel(id: "dsfksjdflgkshdjfgkljshdfg", title: "Level 1", courses: [
          CourseModel(
              id: "sdfasjdkflgsdjfgdsfgdsf",
              profId: "cAc3T73kBbXGOGlmjg1TmGikxp53",
              name: "Real Time",
              courseChapters: [
                ChapterModel(
                    id: "asfkdajdfkasdklfgsdgf",
                    name: "chapter 1",
                    questions: [
                      QuestionModel(
                          id: "zsdfksdhjklgfljksdfg",
                          type: mCQType,
                          questionTitle: "what is your name?",
                          difficulty: 2,
                          options: [
                            OptionModel(
                                id: "dsfasdfgsdkfgsdfg",
                                content: "Ahmed",
                                isCorrect: false),
                            OptionModel(
                                id: "adsdsfdsfhdfghdfghj",
                                content: "mohamed",
                                isCorrect: false),
                            OptionModel(
                                id: "dsfasdfgsghdfgjfghjkdkfgsdfg",
                                content: "gamal",
                                isCorrect: false),
                            OptionModel(
                                id: "dsfasdfgdfhdfghsdkfgsdfg",
                                content: "ali",
                                isCorrect: true),
                          ])
                    ])
              ],
              courseExams: [
                ExamModel(
                    startTime: DateTime.parse("2023-06-22 10:15:30.123456"),
                    endTime: DateTime.parse("2023-06-23 10:15:30.123456"),
                    timeAllowed: 3,
                    id: "dfcgsdfghesdfgydfs",
                    title: "exam on chapter 1",
                    examStandards: [
                      ExamStandardModel(
                          chapterId: "asfkdajdfkasdklfgsdgf",
                          type: mCQType,
                          difficulty: 2,
                          id: "dsfadsfasdfadsfads",
                          count: 1)
                    ],
                    examResults: [
                      ExamResultModel(
                          id: "dsfadsfasdfasdfa",
                          studentId: "VBGPEULWgMexuvt6mfhrVIdyurp2",
                          studentName: "ahmed mohamed",
                          score: 0)
                    ])
              ])
        ])
      ]);
      await FirebaseFirestore.instance.collection('departments').add(departmentModel.toJson());
      // Query the departments collection in Firestore to retrieve all documents
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('departments').get();

      // Convert the documents to DepartmentModel objects
      List<DepartmentModel> departments = querySnapshot.docs
          .map((doc) =>
              DepartmentModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return departments;
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseException.fromFirebaseAuthException(e);
    } on FirebaseException catch (e) {
      throw CustomFirebaseException.fromFirebaseFirestoreException(e);
    } catch (e) {
      log(e.toString());

      throw CustomFirebaseException("", 'An unexpected error occurred');
    }
  }

  @override
  Future<List<LevelModel>> getLevels() async {
    try {
      // Query the departments collection in Firestore to retrieve all departments
      QuerySnapshot departmentsSnapshot =
      await FirebaseFirestore.instance.collection('departments').get();

      // Check that the departments collection contains at least one document
      if (departmentsSnapshot.docs.isEmpty) {
        return [];
      }

      // Retrieve the levels field from the first document in the departments collection
      List<dynamic> levelsJson = departmentsSnapshot.docs[0].get('levels');

      // Map over the levelsJson list to create a list of LevelModel objects
      List<LevelModel> levels =
      levelsJson.map((level) => LevelModel.fromJson(level)).toList();

      // Return the list of LevelModel objects
      return levels;
    } on FirebaseException catch (e) {
      // If there's an error, throw a custom exception
      throw CustomFirebaseException.fromFirebaseFirestoreException(e);
    }
  }
}
