import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:online_exams_system/auth_module/data/model/professor_model.dart';
import 'package:online_exams_system/auth_module/data/model/student_model.dart';
import 'package:online_exams_system/auth_module/data/repo/auth_repo.dart';
import 'package:online_exams_system/auth_module/domain/usecase/get_departments_use_case.dart';
import 'package:online_exams_system/auth_module/domain/usecase/get_levels_use_case.dart';
import 'package:online_exams_system/auth_module/domain/usecase/login_use_case.dart';
import 'package:online_exams_system/auth_module/domain/usecase/student_register_use_case.dart';
import 'package:online_exams_system/models/department_model.dart';
import 'package:online_exams_system/models/level_model.dart';
import 'package:online_exams_system/shared/components/custom_snack_bar.dart';

import '../../data/model/login_model.dart';
import '../../data/remote_data_source/remote_data_source.dart';
import '../../domain/usecase/prof_register_use_case.dart';

class AuthController extends GetxController {
  bool isStudent = true;

  // levelChanged(newLevel) {
  //   selectedLevel = newLevel;
  //   update();
  // }
  //
  // departmentChanged(newDepartment) {
  //   selectedDepartment = newDepartment;
  //   update();
  // }

  var loginEmailController = TextEditingController();
  var loginPasswordController = TextEditingController();

  register() async {
    if (isStudent) {
      final result =
          await StudentRegisterUseCase(AuthRepo(AuthRemoteDataSource()))
              .execute(StudentModel(
                  courses: [],
                  id: "",
                  name:
                      userNameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  departmentModel: _selectedDepartment,
                  levelModel: _selectedLevel));
      result.fold(
          (l) => customSnackBar(
              title: l.code, message: l.message, successful: false),
          (r) => customSnackBar(
              title: "Done",
              message: "Account Created Successfully",
              successful: true));
    } else {
      final result = await ProfRegisterUseCase(AuthRepo(AuthRemoteDataSource()))
          .execute(ProfessorModel(
              courses: [],
              id: "",
              name: userNameController.text,
              email: emailController.text,
              password: passwordController.text));
      result.fold(
          (l) => customSnackBar(
              title: l.code, message: l.message, successful: false),
          (r) => customSnackBar(
              title: "Done",
              message: "Account Created Successfully prof",
              successful: true));
    }
  }

  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  List<LevelModel> levels = [];
  List<DepartmentModel> departments = [];
  late LevelModel _selectedLevel;
  late DepartmentModel _selectedDepartment;

  onLevelChange(LevelModel value) {
    _selectedLevel = value;
    update();
  }

  onDepartmentChange(DepartmentModel value) {
    _selectedDepartment = value;
    update();
  }

  logIn() async {
    final result = await LogInUseCase(AuthRepo(AuthRemoteDataSource())).execute(
        LoginModel(
            email: loginEmailController.text,
            password: loginPasswordController.text));
    result.fold(
        (l) => customSnackBar(
            title: l.code, message: l.message, successful: false),
        (r) => customSnackBar(
            title: "Done", message: "Welcome ${r.name}", successful: true));
  }



  getLevels() async {
    final result = await GetLevelsUseCase(AuthRepo(AuthRemoteDataSource())).execute();
    result.fold(
            (l) => customSnackBar(
            title: l.code, message: l.message, successful: false),
            (r) => levels=r);
    update();
  }
  getDepartments() async {
    final result = await GetDepartmentsUseCase(AuthRepo(AuthRemoteDataSource())).execute();
    result.fold(
            (l) => customSnackBar(
            title: l.code, message: l.message, successful: false),
            (r) => departments=r);
    update();
  }

  @override
  void onInit() {
    getDepartments();
    getLevels();
    super.onInit();
  }
}
