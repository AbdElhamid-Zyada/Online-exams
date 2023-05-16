import 'package:flutter/material.dart';
import 'package:online_exams_system/auth_module/presentation/view/signup.dart';

import '../style/themes.dart';

Color lightGrey = const Color(0xffC1C1C1);
Color lightYellow = const Color(0xffFFBE55);
Color divider = const Color(0xffD9D9D9);
Color background = const Color(0xff272C35);

Widget RegisterationTextFormField(
        {String? hint, IconData? icon, TextEditingController? controller}) =>
    TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Color.fromARGB(250, 3, 48, 67),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Color.fromARGB(250, 3, 48, 67),
        ),
      ),
    );

PreferredSizeWidget buildAppBar({
  buildBackArrow = true,
  void Function()? backArrowPressed,
}) =>
    AppBar(
      toolbarHeight: 60,
      elevation: 10,
      backgroundColor: const Color(0xff353841),
      leading: buildBackArrow
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Themes.grey,
              ),
              onPressed: backArrowPressed,
            )
          : null,
      centerTitle: true,
      title: Image.asset(
        'assets/images/Logo.png',
        width: 54,
        height: 44,
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.menu,
            color: lightGrey,
          ),
          onPressed: () {},
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );

Text materialText({required text, required color}) => Text(
      text,
      style: TextStyle(
        fontFamily: 'Lexend',
        fontWeight: FontWeight.w600,
        fontSize: 22,
        color: color,
      ),
    );

Widget materialCard(
  cardContent,
  void Function(Object?) openContent,
) =>
    GestureDetector(
      child: Container(
        height: 145,
        width: 145,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(13),
          ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/icons/File.png',
              width: 150,
              height: 120,
            ),
            Text(
              cardContent.name,
              style: TextStyle(
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w500,
                color: Color(0xffA5522E),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
      onTap: () => openContent(cardContent),
    );

Widget containerWithFooter({
  List<Widget> columnChildren = const <Widget>[],
}) =>
    Container(
      width: double.infinity,
      color: background,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 21.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: columnChildren,
                ),
              ),
            ),
          ),
          Container(
            height: 63,
            color: background,
            child: MaterialButton(
              onPressed: () {},
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: lightYellow,
                ),
                child: Center(
                  child: Text(
                    "Add New Exam",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: background,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
// one for text 

// one for text button