import 'package:online_exams_system/student_module/data/model/exam_result.dart';

import 'exam_standard_model.dart';

class ExamModel{
  DateTime startTime,endTime;
  int timeAllowed;
  String id;
  String title;
  List<ExamStandardModel>examStandards;
  List<ExamResultModel>examResults;


  ExamModel(
      {required this.startTime,
        required this.endTime,
        required this.timeAllowed,
        required this.id,
        required this.title,
        required this.examStandards,
        required this.examResults});
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> examStandardsJson =
    examStandards.map((standard) => standard.toJSON()).toList();
    List<Map<String, dynamic>> examResultsJson =
    examResults.map((result) => result.toJson()).toList();

    return {
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'timeAllowed': timeAllowed,
      'id': id,
      'title': title,
      'examStandards': examStandardsJson,
      'examResults': examResultsJson,
    };
  }

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    List<Map<String,dynamic>> examStandardsJson = json['examStandards'] ?? [];
    List<dynamic> examResultsJson = json['examResults'] ?? [];

    List<ExamStandardModel> examStandards =List.from(examResultsJson).map((e) => ExamStandardModel.fromJSON(e)).toList();
   ;
    List<ExamResultModel> examResults =
    examResultsJson.map((result) => ExamResultModel.fromJson(result)).toList();

    return ExamModel(
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      timeAllowed: json['timeAllowed'],
      id: json['id'],
      title: json['title'],
      examStandards: examStandards,
      examResults: examResults,
    );
  }
}