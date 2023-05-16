import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_exams_system/auth_module/presentation/controller/auth_controller.dart';
import 'package:online_exams_system/auth_module/presentation/widgets/custom_button.dart';
import 'package:online_exams_system/auth_module/presentation/widgets/custom_password_field.dart';
import 'package:online_exams_system/auth_module/presentation/widgets/custom_text_form_field.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/components.dart';
import '../../../shared/style/themes.dart';
import 'signup.dart';

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Sizer(builder: (context, orientation, deviceType) {
          double width = 100.w;
          double height = 100.h;
          return Column(
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
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(22),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 23,
                    ),
                    child: GetBuilder<AuthController>(builder: (controller) {
                      return Form(
                        child: SizedBox(height: height*0.55,
                          child: Column(
                            children: [
                              Expanded(flex: 3,
                                child: Column(
                                  children: [
                                    Text(
                                      "Sign In",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.headlineLarge,
                                    ),
                                    Text(
                                      "Enter your credentials to\nContinue",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(flex: 8,
                                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomTextFormField(
                                      controller: controller.loginEmailController,
                                      context: context,
                                      label: "E-mail",
                                      suffixIcon: Icons.email,
                                    ),
                                    CustomPasswordField(
                                        controller: controller.loginPasswordController,
                                        label: "Password"), CustomButton(
                                      useGradient: false,
                                      height: height * 0.06,
                                      width: width * 0.7,
                                      onPressed: () => controller.logIn(),
                                      label: "Login",
                                      borderRadius: 25,
                                    ),

                                  ],
                                ),
                              ),
                              // Align(
                              //   alignment: Alignment.centerRight,
                              //   child: TextButton(
                              //     onPressed: () {},
                              //     child: Text("Forget Password ?",
                              //         style: Theme.of(context)
                              //             .textTheme
                              //             .bodyMedium!
                              //             .copyWith(color: Colors.red)),
                              //   ),
                              // ),

                              Expanded(flex: 3,
                                child: Column(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Don't have an account ?",
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                        TextButton(
                                          child: Text(
                                            "Sign Up",
                                            style:  Theme.of(context).textTheme.bodyMedium!.copyWith(color: Themes.red),
                                          ),
                                          onPressed: () {
                                      Get.to(SignUpView());
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
