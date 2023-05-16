import 'chapter model.dart';
import 'exam model.dart';

class Course {
  String id;
  String name;
  List<Chapter> courseChapters;
  List<Exam> courseExams;

  Course({
    required this.id,
    required this.name,
    required this.courseChapters,
    required this.courseExams,
  });

  factory Course.fromJson(map) {
    return Course(
      id: map['id'],
      name: map['name'],
      courseChapters: map['chapters'],
      courseExams: map['exams'],
    );
  }
}
