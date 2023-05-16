
import 'package:online_exams_system/student_module/data/model/course_model.dart';

class LevelModel {
  String id;
  String title;
  List<CourseModel> courses;

  LevelModel({required this.id, required this.title, required this.courses});
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> coursesJson =
    courses.map((course) => course.toJSON()).toList();

    return {
      'id': id,
      'title': title,
      'courses': coursesJson,
    };
  }
  factory LevelModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> coursesJson = json['courses'] ?? [];
    List<CourseModel> courses =
    coursesJson.map((course) => CourseModel.fromJSON(course)).toList();

    return LevelModel(
      id: json['id'],
      title: json['title'],
      courses: courses,
    );
  }


  @override
  String toString() {
    return title.toString();
  }
}