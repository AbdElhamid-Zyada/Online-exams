class ExamStandardModel {
  String chapterId;
  String type;
  int difficulty;
  int count;
  String id;

  ExamStandardModel(
      {required this.chapterId,
        required this.type,
        required this.difficulty,
        required this.id,
        required this.count});

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'chapter_id': chapterId,
      'type': type,
      'difficulty': difficulty,
      'count': count,
    };
  }

  static ExamStandardModel fromJSON(Map<String, dynamic> json) {
    return ExamStandardModel(
      id: json['id'],
      chapterId: json['chapter_id'],
      type: json['type'],
      difficulty: json['difficulty'],
      count: json['count'],
    );
  }
}