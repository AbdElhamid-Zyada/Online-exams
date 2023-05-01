import 'package:firebase_core/firebase_core.dart';
import 'package:online_exams_system/modules/signup/signup.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:online_exams_system/modules/splash/splash.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}
