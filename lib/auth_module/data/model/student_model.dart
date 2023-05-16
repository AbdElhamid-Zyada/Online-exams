import 'package:online_exams_system/models/course%20model.dart';
import 'package:online_exams_system/models/level_model.dart';

import '../../../models/department_model.dart';
import '../../domain/entity/functional_user.dart';

class StudentModel extends FunctionalUser {
  DepartmentModel departmentModel;
  LevelModel levelModel;

  StudentModel(
      {required super.courses,
      required super.id,
      required super.name,
      required super.email,
      required super.password,
      required this.departmentModel,
      required this.levelModel});

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      courses:
          List.from(json['courses']).map((e) => Course.fromJson(e)).toList(),
      id: '',
      name: json['name'],
      email: json['email'],
      password: '',
      departmentModel: DepartmentModel.fromJson(json['department']),
      levelModel: LevelModel.fromJson(json['level']),
    );
  }
}
