import 'dart:ffi';

import 'chapter model.dart';

class Question {
  String id;
  String type;
  String questionTitle;
  Char difficulty;
  String correctAnswer;
  String? studentAnswer;
  List<String> answers;

  Question({
  required this.id,
  required this.type,
   this.studentAnswer,
  required this.questionTitle,
  required this.difficulty,
  required this.correctAnswer,
  required this.answers,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'questionTitle': questionTitle,
      'difficulty': difficulty,
      'correctAnswer': correctAnswer,
      'studentAnswer': studentAnswer,
      'answers': answers,
    };
  }

  Question.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        type = json['type'],
        questionTitle = json['questionTitle'],
        difficulty = json['difficulty'],
        correctAnswer = json['correctAnswer'],
        studentAnswer = json['studentAnswer'],
        answers = List<String>.from(json['answers']);
}
