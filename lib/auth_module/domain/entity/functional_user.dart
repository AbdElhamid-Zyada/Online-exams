import '../../../models/course model.dart';
import 'user.dart';

abstract class FunctionalUser extends LocalUser {
  List<Course> courses;

  FunctionalUser(
      {required this.courses,
      required String id,
      required String name,
      required String email,
      required String password})
      : super(id, name, email, password);
}
