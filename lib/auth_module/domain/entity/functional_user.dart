import '../../../student_module/data/model/course_model.dart';
import 'user.dart';

abstract class FunctionalUser extends LocalUser {
  List<CourseModel> courses;

  FunctionalUser(
      {required this.courses,
      required String id,
      required String name,
      required String email,
      required String password})
      : super(id, name, email, password);
}
