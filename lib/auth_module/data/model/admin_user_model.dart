import 'package:online_exams_system/auth_module/domain/entity/user.dart';

class AdminModel extends LocalUser{
  AdminModel(super.id, super.name, super.email, super.password);
  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(json['id'], json['name'], json['email'], json['password']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}