import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_exams_system/auth_module/data/model/login_model.dart';
import 'package:online_exams_system/auth_module/data/model/professor_model.dart';
import 'package:online_exams_system/auth_module/domain/entity/functional_user.dart';
import 'package:online_exams_system/auth_module/domain/entity/user.dart';
import 'package:online_exams_system/models/department_model.dart';
import 'package:online_exams_system/models/level_model.dart';

import '../../../models/firebase_error_model.dart';
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
      // Query the Levels collection in Firestore to retrieve all documents
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('levels').get();

      // Convert the documents to LevelModel objects
      List<LevelModel> departments = querySnapshot.docs
          .map((doc) =>
          LevelModel.fromJson(doc.data() as Map<String, dynamic>))
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
}
