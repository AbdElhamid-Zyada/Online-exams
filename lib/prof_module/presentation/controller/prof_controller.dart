import 'package:get/get.dart';
import 'package:online_exams_system/auth_module/data/model/professor_model.dart';
import 'package:online_exams_system/auth_module/presentation/controller/auth_controller.dart';
import 'package:online_exams_system/prof_module/data/datasource/prof_remote_data_source.dart';
import 'package:online_exams_system/prof_module/data/repo/prof_repo.dart';
import 'package:online_exams_system/prof_module/domain/usecase/get_prof_courses_use_case.dart';
import 'package:online_exams_system/shared/components/custom_snack_bar.dart';

import '../../../student_module/data/model/course_model.dart';

class ProfController extends GetxController {
  late RxList<CourseModel> profCourses;
  late ProfessorModel currentProf;

  getProfCourses() async {
    final authC = Get.find<AuthController>();
    currentProf = (authC.currentUser as ProfessorModel);
    final results =
        await GetProfCoursesUseCase(ProfRepo(ProfRemoteDataSource()))
            .execute(currentProf.id);
    results.fold(
        (l) => customSnackBar(
            title: l.code, message: l.message, successful: false),
        (r) => null);
  }

  @override
  void onInit() {
    profCourses = <CourseModel>[].obs;
    getProfCourses();
    super.onInit();
  }
}
