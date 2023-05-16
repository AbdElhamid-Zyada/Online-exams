
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class Themes {
  static final Color darkBlue = Color(0xff272C35);
  static final Color softBlue = Color.fromARGB(255, 194, 227, 251);
 static final Color green = Color(0xff195D51);
 static final Color grey = Color(0xffD9D9D9);
 static final Color selectedText = Color(0xffFFFFFF);
 static final Color notSelectedText = Color(0xff033043);
 static const Color red = Color.fromARGB(250, 158, 42, 43);
  static final TextTheme _phoneTextTheme=TextTheme(
    headlineLarge: TextStyle(
        fontFamily: 'montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 30.0.sp,color: Colors.black
    ),
    headlineMedium: TextStyle(
        fontFamily: 'montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 16.0.sp,color: Colors.black
    ),
    displayLarge: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: 18.0.sp,color: Colors.black
    ),
    displayMedium: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 14.0.sp,color: Colors.black
    ),
    displaySmall: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: 12.0.sp,color: Colors.black
    ),
    bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.normal,
        fontSize: 12.0.sp,color: Colors.black
    ),
    bodySmall: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.normal,
        fontSize: 8.0.sp,color: Colors.black
    ),
  );
  static final TextTheme _tabletTextTheme = TextTheme(
    headlineLarge: TextStyle(
        fontFamily: 'Lexend',
        fontWeight: FontWeight.w700,
        fontSize: 12.0.sp,color: Colors.white
    ),
    headlineMedium: TextStyle(
        fontFamily: 'Lexend',
        fontWeight: FontWeight.w600,
        fontSize: 10.0.sp,color: Colors.white
    ),
    displayLarge: TextStyle(
        fontFamily: 'Lexend',
        fontWeight: FontWeight.w600,
        fontSize: 6.0.sp,color: Colors.white
    ),
    displayMedium: TextStyle(
        fontFamily: 'Lexend',
        fontWeight: FontWeight.w600,
        fontSize: 4.0.sp,color: Colors.white
    ),
    displaySmall: TextStyle(
        fontFamily: 'Lexend',
        fontWeight: FontWeight.w500,
        fontSize: 2.0.sp,color: Colors.white
    ),
    bodyMedium: TextStyle(
        fontFamily: 'Lexend',
        fontWeight: FontWeight.normal,
        fontSize: 2.0.sp,color: Colors.white
    ),
    bodySmall: TextStyle(
        fontFamily: 'Lexend',
        fontWeight: FontWeight.normal,
        fontSize: 1.0.sp,color: Colors.white
    ),
  );

  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: darkBlue,
    dividerColor: Colors.grey.shade300,
    primaryColor: darkBlue,
    textTheme: SizerUtil.deviceType==DeviceType.mobile?_phoneTextTheme:_tabletTextTheme,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darkBlue,
    ),
  );
}