class OptionModel {
  String id;
  String content;
  bool isCorrect;

  OptionModel({required this.id, required this.content, required this.isCorrect});

  Map<String, dynamic> toJSON() {
    return {'content': content, 'is_correct': isCorrect};
  }

  static OptionModel fromJSON(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'],
      content: json['content'],
      isCorrect: json['is_correct'],
    );
  }
}