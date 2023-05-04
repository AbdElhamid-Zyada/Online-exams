import 'dart:ffi';

class Question {
  String? id;
  String? type;
  String? question;
  Char? difficulty;
  String? correctAnswer;
  List<String>? wrongAnswers;

  Question({
    this.id,
    this.type,
    this.question,
    this.difficulty,
    this.correctAnswer,
    this.wrongAnswers,
  });

  factory Question.fromFirebase(map) {
    print("in creating question iz $map");
    return Question(
      id: map['id'],
      type: map['type'],
      question: map['question'],
      correctAnswer: map['correct answer'],
      wrongAnswers: map['wrong answers'],
      difficulty: map['difficulty'],
    );
  }
}
