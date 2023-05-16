import '../../../student_module/data/model/course_model.dart';
import '../../domain/entity/functional_user.dart';

class ProfessorModel extends FunctionalUser {
  ProfessorModel(
      {required super.courses,
      required super.id,
      required super.name,
      required super.email,
      required super.password});


factory ProfessorModel.fromJson(Map<String, dynamic> json) {
return ProfessorModel(
courses:
List.from(json['courses']).map((e) => CourseModel.fromJSON(e)).toList(),
id: '',
name: json['name'],
email: json['email'],
password: '',
);
}
}
