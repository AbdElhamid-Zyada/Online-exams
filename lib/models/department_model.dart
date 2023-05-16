class DepartmentModel {
  String id;
  String title;

  DepartmentModel({required this.id, required this.title});

  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(id: json['id'], title: json['name']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.title;
    return data;
  }
  @override
  String toString() {
    return title.toString();
  }
}