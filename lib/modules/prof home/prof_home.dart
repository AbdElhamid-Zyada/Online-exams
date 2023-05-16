import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_exams_system/auth_module/presentation/controller/auth_controller.dart';
import 'package:online_exams_system/prof_module/presentation/controller/prof_controller.dart';
import 'package:online_exams_system/shared/components/components.dart';

import '../course page/course_page.dart';

Color lightGrey = const Color(0xffC1C1C1);
Color lightYellow = const Color(0xffFFBE55);

double crossSpacing = 30;
double mainSpacing = 40;




class ProfessorHomeView extends StatelessWidget {
  final profController = Get.find<ProfController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        buildBackArrow: false,
      ),
      body: Container(
        width: double.infinity,
        color: const Color(0xff272C35),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 21.0,
          ),
          child: Container(
            height: double.infinity,
            child: Obx(()=>SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          materialText(
                            text: "Welcome, ${profController.currentProf.name}",
                            color: lightGrey,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          materialText(
                            text: "Your Courses",
                            color: lightYellow,
                          ),
                        ],
                      ),
                      const Expanded(
                          child: SizedBox(
                            width: 10,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  Container(
                    height: 900,
                    alignment: AlignmentDirectional.center,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: crossSpacing,
                        mainAxisSpacing: mainSpacing,
                      ),
                      itemCount: profController.profCourses.length,
                      itemBuilder: (context, index) =>
                          materialCard(profController.profCourses[index], courseSelected),
                    ),
                  ),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }




  void courseSelected(selectedCourse) {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => CoursePage(selectedCourse),
    //     ));
  }
}
