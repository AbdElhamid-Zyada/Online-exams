import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_exams_system/auth_module/presentation/controller/auth_controller.dart';

import 'package:online_exams_system/auth_module/presentation/view/signin.dart';
import 'package:online_exams_system/auth_module/presentation/widgets/custom_drop_down.dart';
import 'package:sizer/sizer.dart';
import '../../../shared/components/components.dart';
import 'package:get/get.dart';

import '../../../shared/style/themes.dart';
import '../widgets/custom_password_field.dart';
import '../widgets/custom_text_form_field.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      final double height = 100.h;
      final double width = 100.w;
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
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
                    child: GetBuilder<AuthController>(builder: (controller) {
                      return Form(
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
                                      color: controller.isStudent
                                          ? Themes.green
                                          : Themes.grey,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        controller.isStudent = true;
                                        controller.update();
                                      },
                                      child: Text(
                                        "student",
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: controller.isStudent
                                              ? Themes.selectedText
                                              : Themes.notSelectedText,
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
                                      color: controller.isStudent
                                          ? Themes.grey
                                          : Themes.green,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        controller.isStudent = false;
                                        controller.update();
                                      },
                                      child: Text(
                                        "professor",
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: controller.isStudent
                                              ? Themes.notSelectedText
                                              : Themes.selectedText,
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
                            CustomTextFormField(
                              controller: controller.userNameController,
                              context: context,
                              label: "user name",
                              suffixIcon: Icons.person,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            controller.isStudent
                                ? SizedBox(width: width*0.8,
                                  child: Row(
                                    children: [
                                      Expanded(flex:1,
                                        child: CustomDropdownWidget(
                                            label: "Level",
                                            items: controller.levels,
                                            onChanged: (value)=>controller.onLevelChange(value)),
                                      ),    Expanded(flex:1,
                                        child:          CustomDropdownWidget(
                                            label: "department",
                                            items: controller.departments,
                                            onChanged: (value)=>controller.onDepartmentChange(value)),

                                      ),

                                    ],
                                  ),
                                )
                                : Container(),
                        CustomTextFormField(
                          controller: controller.emailController,
                          context: context,
                          label: "E-mail",
                          suffixIcon: Icons.email,
                        ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomPasswordField(
                                controller: controller.passwordController,
                                label: "Password"),
                            SizedBox(
                              height: 20,
                            ),
                            CustomPasswordField(
                                controller: controller.confirmPasswordController,
                                label: "Password"),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(250, 158, 42, 43),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                              child: TextButton(
                                onPressed: () => controller.register(),
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
                                    color: Colors.black,
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
                                    Get.to(SignInView());
                                    // Navigator.pushReplacement(context,
                                    //     MaterialPageRoute(builder: (context) => SignIn()));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

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
}
