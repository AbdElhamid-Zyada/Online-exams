class Chapter {
  String? id;
  String? name;
  List<dynamic>? mcqQuestions;
  List<dynamic>? tfQuestions;

  Chapter({
    this.id,
    this.name,
    this.mcqQuestions,
    this.tfQuestions,
  });

  factory Chapter.fromFirebase(map) {
    print("in creating chapter iz $map");
    return Chapter(
      id: map['id'],
      name: map['name'],
      mcqQuestions: map['mcq questions'],
      tfQuestions: map['tf questions'],
    );
  }
}
