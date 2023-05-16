class ExamResultModel{
  String id;
  String studentId;
  String studentName;
  double score;

  ExamResultModel({required this.id,required this.studentId,required this.studentName,required this.score});
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentId': studentId,
      'studentName': studentName,
      'score': score,
    };
  }


  factory ExamResultModel.fromJson(Map<String, dynamic> json) {
    return ExamResultModel(
      id: json['id'],
      studentId: json['studentId'],
      studentName: json['studentName'],
      score: json['score'].toDouble(),
    );
  }
}