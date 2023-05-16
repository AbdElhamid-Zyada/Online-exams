import 'package:online_exams_system/shared/app_constants.dart';
import 'package:online_exams_system/student_module/data/model/level_model.dart';

class DepartmentModel {
  String id;
  String title;
  List<LevelModel>levels;

  DepartmentModel({required this.id, required this.title,required this.levels});
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> levelsJson =
    levels.map((level) => level.toJson()).toList();

    return {
      idKey: id,
      'title': title,
      'levels': levelsJson,
    };
  }
  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> levelsJson = json['levels'] ?? [];
    List<LevelModel> levels =
    levelsJson.map((level) => LevelModel.fromJson(level)).toList();

    return DepartmentModel(
      id: json['id'],
      title: json['title'],
      levels: levels,
    );
  }

  @override
  String toString() {
    return title.toString();
  }
}