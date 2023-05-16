
import 'grade_model.dart';
import 'standred.dart';

class Exam {
  String id;
  String name;
  DateTime date;
  int duration;
  int totalGrades;
  List<GradeModel> grades;
  List<ExamStandard> standards;


  Exam({
   required this.id,
   required this.name,
   required this.date,
   required this.duration,
   required this.totalGrades,
    required this.grades,
    required this.standards,

  });


}
