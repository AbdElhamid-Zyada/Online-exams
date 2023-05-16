

import 'option_model.dart';

class QuestionModel {
  String id;
  String type;
  String questionTitle;
  int difficulty;
  List<OptionModel> options;
  // String correctAnswer;
  // String? studentAnswer;
  // List<String> answers;

  QuestionModel({
    required this.id,
    required this.type,
    required this.questionTitle,
    required this.difficulty,
    required this.options,
    //  this.studentAnswer,
    // required this.correctAnswer,
    // required this.answers,
  });

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'type': type,
      'questionTitle': questionTitle,
      'difficulty': difficulty,
      'options': options.map((option) => option.toJSON()).toList(),
    };
  }

  static QuestionModel fromJSON(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      type: json['type'],
      questionTitle: json['questionTitle'],
      difficulty: json['difficulty'],
      options: List<OptionModel>.from(
          json['options'].map((optionJson) => OptionModel.fromJSON(optionJson))),
    );
  }
}