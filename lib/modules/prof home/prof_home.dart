import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:online_exams_system/models/course%20model.dart';
import 'package:online_exams_system/shared/components/components.dart';

import '../course page/course_page.dart';

Color lightGrey = const Color(0xffC1C1C1);
Color lightYellow = const Color(0xffFFBE55);

double crossSpacing = 30;
double mainSpacing = 40;

String userName = "Dr Amr";

List<String> doctorCourses = [
  'If4ESeyKyeD0KV89Ysq2',
  '5qjuoc6djcLUm4VcjZm3',
];

class ProfessorHome extends StatefulWidget {
  @override
  State<ProfessorHome> createState() => _ProfessorHomeState();
}

class _ProfessorHomeState extends State<ProfessorHome> {
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  welcomeText(),
                  const SizedBox(
                    height: 25,
                  ),
                  viewCoursesCards(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget welcomeText() => Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              materialText(
                text: "Welcome, ${userName}",
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
      );

  Widget viewCoursesCards() => StreamBuilder<List<Course?>>(
        stream: getProfessorCourses(),
        builder: (context, snapshot) {
          print(snapshot.error);
          if (snapshot.hasError) {
            return const Text("invalid");
          } else if (snapshot.hasData) {
            final courses = snapshot.data!;
            print("doctor courses iz $courses");
            courses.removeWhere(
              (element) => element is Null,
            );
            print("doctor courses iz $courses");
            return Column(
              children: [
                Container(
                  height: 900,
                  alignment: AlignmentDirectional.center,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: crossSpacing,
                      mainAxisSpacing: mainSpacing,
                    ),
                    itemCount: courses.length,
                    itemBuilder: (context, index) =>
                        materialCard(courses[index]!, courseSelected),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );

  Stream<List<Course?>> getProfessorCourses() {
    return FirebaseFirestore.instance
        .collection("courses")
        .snapshots()
        .map((snapshot) {
      print("courses iz ${doctorCourses}");
      return snapshot.docs.map((e) {
        print(e.data());
        if (doctorCourses.contains("${e.id}")) {
          Map<String, dynamic> map = e.data();
          map['id'] = e.id;
          print("id iz ${map}");
          return Course.fromFirebase(map);
        }
      }).toList();
    });
  }

  void courseSelected(selectedCourse) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CoursePage(selectedCourse),
        ));
  }
}
