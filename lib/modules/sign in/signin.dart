import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../signup/signup.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();

class SignIn extends StatelessWidget {
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
                  child: buildSignIn(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSignIn(context) => Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 41,
            ),
            Text(
              "Sign In",
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
              "Enter your credentials to\nContinue",
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
            RegisterationTextFormField(
              hint: "Enter your e-mail",
              icon: Icons.email_rounded,
              controller: emailController,
            ),
            SizedBox(
              height: 35,
            ),
            RegisterationTextFormField(
              hint: "Enter your password",
              icon: Icons.lock,
              controller: passwordController,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forget Password ?",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(250, 158, 42, 43),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
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
                  "Sign In",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account ?",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                TextButton(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color.fromARGB(250, 158, 42, 43),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                ),
              ],
            ),
          ],
        ),
      );
}
