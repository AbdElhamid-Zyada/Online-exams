import 'package:cloud_firestore/cloud_firestore.dart';

class Exam {
  String? id;
  String? name;
  Timestamp? date;
  int? duration;
  int? totalGrades;
  Map<String, dynamic>? grades;
  Map<String, dynamic>? mcq_A;
  Map<String, dynamic>? mcq_B;
  Map<String, dynamic>? mcq_C;
  Map<String, dynamic>? tf_A;
  Map<String, dynamic>? tf_B;
  Map<String, dynamic>? tf_C;

  Exam({
    this.id,
    this.name,
    this.date,
    this.duration,
    this.totalGrades,
    this.grades,
    this.mcq_A,
    this.mcq_B,
    this.mcq_C,
    this.tf_A,
    this.tf_B,
    this.tf_C,
  });

  factory Exam.fromFirebase(map) {
    print("in creating Exam iz $map");
    return Exam(
      id: map['id'],
      name: map['name'],
      date: map['date'],
      duration: map['duration'],
      totalGrades: map['total grades'],
      grades: map['grades'],
      mcq_A: map['mcq A'],
      mcq_B: map['mcq B'],
      mcq_C: map['mcq C'],
      tf_A: map['tf A'],
      tf_B: map['tf B'],
      tf_C: map['tf C'],
    );
  }
}
