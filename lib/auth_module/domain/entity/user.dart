import '../../../models/course model.dart';

abstract class LocalUser {
  String id;
  String name;
  String email;
  String password;


  LocalUser(this.id, this.name, this.email, this.password);
}