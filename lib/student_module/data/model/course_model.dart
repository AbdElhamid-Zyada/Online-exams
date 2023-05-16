import 'chapter_model.dart';
import 'exam_model.dart';

class CourseModel {
  String id;
  String profId;
  String name;
  List<ChapterModel> courseChapters;
  List<ExamModel> courseExams;

  CourseModel({
    required this.id,
    required this.profId,
    required this.name,
    required this.courseChapters,
    required this.courseExams,
  });

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'prof_id': profId,
      'name': name,
      'courseChapters': courseChapters.map((chapter) => chapter.toJSON()).toList(),
      'courseExams': courseExams.map((exam) => exam.toJson()).toList(),
    };
  }

  static CourseModel fromJSON(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      name: json['name'],
      courseChapters: List<ChapterModel>.from(
          json['courseChapters'].map((chapterJson) => ChapterModel.fromJSON(chapterJson))),
      courseExams: List<ExamModel>.from(
          json['courseExams'].map((examJson) => ExamModel.fromJson(examJson))), profId: json['prof_id'],
    );
  }
}