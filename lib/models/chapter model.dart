import 'package:online_exams_system/models/question%20model.dart';
import 'package:online_exams_system/models/standred.dart';
import 'package:online_exams_system/shared/app_constants.dart';

class Chapter {
  String id;
  String name;
  List<Question> mcqQuestions;
  List<Question> tfQuestions;

  Chapter({
    required this.id,
    required this.name,
    required this.mcqQuestions,
    required this.tfQuestions,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'questions': (mcqQuestions + tfQuestions)
          .map((question) => question.toJson())
          .toList(),
    };
  }

  Chapter.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        mcqQuestions = List<Question>.from(json['questions']
                .map((questionJson) => Question.fromJson(questionJson)))
            .where((element) => element.type == AppConstants.mCQType)
            .toList(),
        tfQuestions = List<Question>.from(json['questions']
                .map((questionJson) => Question.fromJson(questionJson)))
            .where((element) => element.type == AppConstants.tFQType)
            .toList();
}
