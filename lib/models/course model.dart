class Course {
  String? id;
  String? name;
  List<dynamic>? courseChapters;
  List<dynamic>? courseExams;

  Course({
    this.id,
    this.name,
    this.courseChapters,
    this.courseExams,
  });

  factory Course.fromFirebase(map) {
    print("in creating course iz $map");
    return Course(
      id: map['id'],
      name: map['name'],
      courseChapters: map['chapters'],
      courseExams: map['exams'],
    );
  }
}
