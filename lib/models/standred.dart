enum QuestionTypes { MCQ, TF }

enum questionDifficulty { A, B, C }

class ExamStandard {
  String chapterId;
  QuestionTypes type;
  questionDifficulty difficulty;
  int count;

  ExamStandard(
      {required this.chapterId,
      required this.type,
      required this.difficulty,
      required this.count});
}
