import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:online_exams_system/modules/sign%20in/signin.dart';
import '../../shared/components/components.dart';

bool isStudent = true;
Color green = Color(0xff195D51);
Color grey = Color(0xffD9D9D9);
Color selectedText = Color(0xffFFFFFF);
Color notSelectedText = Color(0xff033043);

var firstNameController = TextEditingController();
var lastNameController = TextEditingController();
var emailController = TextEditingController();
var passwordController = TextEditingController();
var confirmPasswordController = TextEditingController();

List<String> levels = [];
List<String> departments = [];

String? selectedLevel;
String? selectedDepartment;

List<String> defaultOptions = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff272C35),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 270,
              child: Center(
                child: Image(
                  image: AssetImage('assets/images/Logo.png'),
                  width: 156,
                  height: 123,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(22),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 23,
                  ),
                  child: buildSignUp(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSignUp() => Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 41,
            ),
            Text(
              "Sign Up",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Enter your data to\nContinue",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color.fromARGB(100, 100, 106, 121),
              ),
            ),
            SizedBox(
              height: 41,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: isStudent ? green : grey,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isStudent = true;
                        });
                      },
                      child: Text(
                        "student",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: isStudent ? selectedText : notSelectedText,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: isStudent ? grey : green,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isStudent = false;
                        });
                      },
                      child: Text(
                        "professor",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: isStudent ? notSelectedText : selectedText,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: RegisterationTextFormField(
                    hint: "First name",
                    icon: Icons.person,
                    controller: firstNameController,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: RegisterationTextFormField(
                    hint: "Last name",
                    icon: Icons.person,
                    controller: lastNameController,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            isStudent
                ? Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        RegisterationDropDownMenu(
                          imagePath: 'assets/icons/Vector.png',
                          hintText: "Level",
                          options: defaultOptions,
                          selectedOption: selectedLevel,
                          onChanged: levelChanged,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RegisterationDropDownMenu(
                          imagePath: 'assets/icons/Faculty.png',
                          hintText: "Faculty",
                          options: defaultOptions,
                          selectedOption: selectedDepartment,
                          onChanged: departmentChanged,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                : Container(),
            RegisterationTextFormField(
              hint: "Academic E-mail",
              icon: Icons.email_rounded,
              controller: emailController,
            ),
            SizedBox(
              height: 20,
            ),
            RegisterationTextFormField(
              hint: "Password",
              icon: Icons.lock,
              controller: passwordController,
            ),
            SizedBox(
              height: 20,
            ),
            RegisterationTextFormField(
              hint: "Confirm password",
              icon: Icons.lock,
              controller: confirmPasswordController,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(250, 158, 42, 43),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Have an account ?",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                TextButton(
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color.fromARGB(250, 158, 42, 43),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                ),
              ],
            ),
          ],
        ),
      );

  Widget RegisterationDropDownMenu({
    required imagePath,
    required hintText,
    required selectedOption,
    required List<String> options,
    required void Function(Object?)? onChanged,
  }) =>
      Container(
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
              width: 12,
            ),
            Image.asset(
              imagePath,
              color: Color.fromARGB(255, 3, 48, 67),
              // fit: BoxFit.fill,
              // width: 22,
              // height: 24,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: DropdownButton(
                isExpanded: true,
                // elevation: 12,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color.fromARGB(250, 3, 48, 67),
                ),
                hint: Text(
                  hintText,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color.fromARGB(250, 3, 48, 67),
                  ),
                ),
                value: selectedOption,
                items: options.map((option) {
                  return DropdownMenuItem(
                    value: option,
                    child: Text(
                      option,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color.fromARGB(250, 3, 48, 67),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (newOption) {
                  onChanged!(newOption);
                },
              ),
            ),
          ],
        ),
      );

  levelChanged(newLevel) {
    setState(() {
      selectedLevel = newLevel;
    });
  }

  departmentChanged(newDepartment) {
    setState(() {
      selectedDepartment = newDepartment;
    });
  }
}
