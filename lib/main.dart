import 'package:firebase_core/firebase_core.dart';
import 'package:online_exams_system/auth_module/presentation/view/signup.dart';
import 'package:online_exams_system/prof_module/presentation/controller/prof_controller.dart';
import 'package:online_exams_system/shared/style/themes.dart';
import 'package:sizer/sizer.dart';
import 'auth_module/presentation/controller/auth_controller.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:online_exams_system/modules/splash/splash.dart';

import 'modules/prof home/prof_home.dart';
import 'package:get/get.dart';

import 'auth_module/presentation/view/signin.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {


  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        fallbackLocale: const Locale('en'),
        debugShowCheckedModeBanner: true,
        useInheritedMediaQuery: true,
        initialRoute:'/login',
        theme: Themes.lightTheme,
        getPages: [

          GetPage(
            name: '/register',binding: BindingsBuilder(() {
            Get.put(AuthController(),permanent: true);


          }),
            page: () => SignUpView(),
          ),
          GetPage(
            name: '/login',binding: BindingsBuilder(() {
            Get.put(AuthController(),permanent: true);


          }),
            page: () => SignInView(),
          ),   GetPage(
            name: '/prof_home',binding: BindingsBuilder(() {
            Get.put(ProfController(),permanent: true);


          }),
            page: () => ProfessorHomeView(),
          ),

        ],
      ),
    );
  }
}
