// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBrLXX6bEzpfoQFeC_cHYEuV5l5O3peeek',
    appId: '1:974384798373:web:bdb81c27d3bd748307cb4c',
    messagingSenderId: '974384798373',
    projectId: 'online-exams-ed0e7',
    authDomain: 'online-exams-ed0e7.firebaseapp.com',
    storageBucket: 'online-exams-ed0e7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCanjoyZdbQVSioSflPWuR61JkyURpZ4hY',
    appId: '1:974384798373:android:8379eda3c9d048af07cb4c',
    messagingSenderId: '974384798373',
    projectId: 'online-exams-ed0e7',
    storageBucket: 'online-exams-ed0e7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBcxy64X1nu-A4IeDA6j9jm0bqaGoKE4UU',
    appId: '1:974384798373:ios:6e05910da28ecf0007cb4c',
    messagingSenderId: '974384798373',
    projectId: 'online-exams-ed0e7',
    storageBucket: 'online-exams-ed0e7.appspot.com',
    iosClientId: '974384798373-unit0a6cpi41ohee564fbf1lk0kfcjhb.apps.googleusercontent.com',
    iosBundleId: 'com.example.onlineExamsSystem',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBcxy64X1nu-A4IeDA6j9jm0bqaGoKE4UU',
    appId: '1:974384798373:ios:6e05910da28ecf0007cb4c',
    messagingSenderId: '974384798373',
    projectId: 'online-exams-ed0e7',
    storageBucket: 'online-exams-ed0e7.appspot.com',
    iosClientId: '974384798373-unit0a6cpi41ohee564fbf1lk0kfcjhb.apps.googleusercontent.com',
    iosBundleId: 'com.example.onlineExamsSystem',
  );
}