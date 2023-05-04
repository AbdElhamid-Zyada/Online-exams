import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:online_exams_system/models/chapter%20model.dart';
import 'package:online_exams_system/models/exam%20model.dart';
import 'package:online_exams_system/modules/chapter%20details/chapter_details.dart';
import 'package:online_exams_system/modules/exam%20details/exam_details.dart';
import 'package:online_exams_system/modules/new%20exam/new_exam.dart';
import 'package:online_exams_system/modules/signup/signup.dart';
import 'package:online_exams_system/shared/components/components.dart';

import '../../models/course model.dart';

Course pageCourse = Course();

double crossSpacing = 30;
double mainSpacing = 40;

Color lightGrey = const Color(0xffC1C1C1);
Color lightYellow = const Color(0xffFFBE55);
Color divider = const Color(0xffD9D9D9);
Color background = const Color(0xff272C35);

List<String> courseChapters = [
  'pZviBbiIScqubPz9EwAd',
];
List<String> courseExams = [
  'W2U4ueIHhwJdzaJdUHlT',
];

class CoursePage extends StatefulWidget {
  CoursePage(Course selectedCourse) {
    pageCourse = selectedCourse;
  }
  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        backArrowPressed: backArrow,
      ),
      body: containerWithFooter(
        columnChildren: [
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              materialText(
                text: pageCourse.name!,
                color: lightYellow,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          viewChaptersCards(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
            ),
            child: Divider(
              color: divider,
              thickness: 1.5,
            ),
          ),
          Row(
            children: [
              materialText(
                text: "Course Exams",
                color: lightYellow,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          viewExamsCards(),
        ],
      ),
    );
  }

  Widget viewChaptersCards() => StreamBuilder<List<Chapter?>>(
        stream: getCourseChapters(),
        builder: (context, snapshot) {
          print("error if found iz ${snapshot.error}");
          if (snapshot.hasError) {
            return const Text("invalid");
          } else if (snapshot.hasData) {
            final chapters = snapshot.data!;
            print("course chapters iz $chapters");
            chapters.removeWhere(
              (element) => element is Null,
            );
            print("course chapters iz $chapters");
            return Container(
              height: 195 * (((chapters.length + 1) / 2).truncateToDouble()),
              alignment: AlignmentDirectional.center,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: crossSpacing,
                  mainAxisSpacing: mainSpacing,
                ),
                itemCount: chapters.length,
                itemBuilder: (context, index) =>
                    materialCard(chapters[index]!, chapterSelected),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );

  Widget viewExamsCards() => StreamBuilder<List<Exam?>>(
        stream: getCourseExams(),
        builder: (context, snapshot) {
          print("error if found iz ${snapshot.error}");
          if (snapshot.hasError) {
            return const Text("invalid");
          } else if (snapshot.hasData) {
            final exams = snapshot.data!;
            print("course exams iz $exams");
            exams.removeWhere(
              (element) => element is Null,
            );
            print("course exams iz $exams");
            return Container(
              height: 195 * (((exams.length + 1) / 2).truncateToDouble()),
              alignment: AlignmentDirectional.center,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: crossSpacing,
                  mainAxisSpacing: mainSpacing,
                ),
                itemCount: exams.length,
                itemBuilder: (context, index) =>
                    materialCard(exams[index]!, ExamSelected),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );

  Stream<List<Chapter?>> getCourseChapters() {
    print("course chapters iz $courseChapters");
    return FirebaseFirestore.instance
        .collection("chapters")
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((e) {
        print("one chapter iz ${e.data()}");
        if (courseChapters.contains("${e.id}")) {
          Map<String, dynamic> map = e.data();
          map['id'] = e.id;
          print("id iz ${map}");
          return Chapter.fromFirebase(map);
        }
      }).toList();
    });
  }

  Stream<List<Exam?>> getCourseExams() {
    print("course exams iz $courseExams");
    return FirebaseFirestore.instance
        .collection("exams")
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((e) {
        print("one exam iz ${e.data()}");
        if (courseExams.contains("${e.id}")) {
          Map<String, dynamic> map = e.data();
          map['id'] = e.id;
          print("id iz ${map}");
          return Exam.fromFirebase(map);
        }
      }).toList();
    });
  }

  backArrow() {
    Navigator.pop(context);
  }

  void chapterSelected(selectedChapter) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChapterDetailsPage(selectedChapter),
        ));
  }

  void ExamSelected(selectedExam) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ExamDetailsPage(selectedExam),
        ));
  }

  void addNewExam() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewExamPage(),
        ));
  }
}
