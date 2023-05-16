import 'package:online_exams_system/student_module/data/model/question_model.dart';

class ChapterModel {
  String id;
  String name;
  List<QuestionModel> questions;

  ChapterModel({
    required this.id,
    required this.name,
    required this.questions,
  });

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'name': name,
      'questions': questions.map((question) => question.toJSON()).toList(),
    };
  }

  static ChapterModel fromJSON(Map<String, dynamic> json) {
    return ChapterModel(
      id: json['id'],
      name: json['name'],
      questions: List<QuestionModel>.from(
          json['questions'].map((questionJson) => QuestionModel.fromJSON(questionJson))),
    );
  }
}