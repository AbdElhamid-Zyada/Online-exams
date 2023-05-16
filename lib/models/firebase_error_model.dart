import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomFirebaseException implements Exception {
  final String code;
  final String message;

  CustomFirebaseException(this.code, this.message);

  factory CustomFirebaseException.fromFirebaseAuthException(FirebaseAuthException e) {
    return CustomFirebaseException(e.code, e.message ?? 'An unexpected error occurred');
  }

  factory CustomFirebaseException.fromFirebaseFirestoreException(FirebaseException e) {
    return CustomFirebaseException(e.code.toString(), e.message ?? 'An unexpected error occurred');
  }

  @override
  String toString() {
    return 'FirebaseException: $code - $message';
  }
}