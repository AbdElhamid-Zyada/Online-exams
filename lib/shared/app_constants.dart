import 'package:online_exams_system/models/department_model.dart';
import 'package:online_exams_system/student_module/data/model/chapter_model.dart';
import 'package:online_exams_system/student_module/data/model/course_model.dart';
import 'package:online_exams_system/student_module/data/model/exam_model.dart';
import 'package:online_exams_system/student_module/data/model/exam_result.dart';
import 'package:online_exams_system/student_module/data/model/exam_standard_model.dart';
import 'package:online_exams_system/student_module/data/model/option_model.dart';
import 'package:online_exams_system/student_module/data/model/question_model.dart';

import '../student_module/data/model/level_model.dart';


  const String mCQType = "MCQ";
  const String tFQType = "TF";

  const String departmentsKey = "departments";
  const String idKey = "id";
  const String levelsKey = "levels";
  const String nameKey = "name";
  const String coursesKey = "courses";
  const String chaptersKey = "chapters";
  const String questionsKey = "questions";
  const String optionContentKey = "content";
  const String questionDifficultyKey = "difficulty";
  const String questionOptionsKey = "options";
  const String optionIsCorrectKey = "is_correct";
  const String questionTypeKey = "type";
  const String examsKey = "exams";
  const String endTimeKey = "end_time";
  const String startTimeKey = "start_time";
  const String timeAllowedKey = "time_allowed";
  const String examTitleKey = "title";
  const String examResultsKey = "exam_results";
  const String examScoreKey = "score";
  const String studentIdKey = "student_id";
  const String studentNameKey = "student_name";
  const String examStandardsKey = "exam_standards";
  const String chapterIdKey = "chapter_id";
  const String questionsCountKey = "questions_count";

  const String profsKey = "professors";
  const String studentsKey = "students";


DepartmentModel departmentModel =
    DepartmentModel(id: "asdasdfjkasdfjksdahfg", title: "CS", levels: [
  LevelModel(id: "dsfksjdflgkshdjfgkljshdfg", title: "Level 1", courses: [
    CourseModel(
        id: "sdfasjdkflgsdjfgdsfgdsf",
        profId: "cAc3T73kBbXGOGlmjg1TmGikxp53",
        name: "Real Time",
        courseChapters: [
          ChapterModel(
              id: "asfkdajdfkasdklfgsdgf",
              name: "chapter 1",
              questions: [
                QuestionModel(
                    id: "zsdfksdhjklgfljksdfg",
                    type: mCQType,
                    questionTitle: "what is your name?",
                    difficulty: 2,
                    options: [
                      OptionModel(
                          id: "dsfasdfgsdkfgsdfg",
                          content: "Ahmed",
                          isCorrect: false),
                      OptionModel(
                          id: "adsdsfdsfhdfghdfghj",
                          content: "mohamed",
                          isCorrect: false),
                      OptionModel(
                          id: "dsfasdfgsghdfgjfghjkdkfgsdfg",
                          content: "gamal",
                          isCorrect: false),
                      OptionModel(
                          id: "dsfasdfgdfhdfghsdkfgsdfg",
                          content: "ali",
                          isCorrect: true),
                    ])
              ])
        ],
        courseExams: [
          ExamModel(
              startTime: DateTime.parse("2023-06-22 10:15:30.123456"),
              endTime: DateTime.parse("2023-06-23 10:15:30.123456"),
              timeAllowed: 3,
              id: "dfcgsdfghesdfgydfs",
              title: "exam on chapter 1",
              examStandards: [
                ExamStandardModel(
                    chapterId: "asfkdajdfkasdklfgsdgf",
                    type: mCQType,
                    difficulty: 2,
                    id: "dsfadsfasdfadsfads",
                    count: 1)
              ],
              examResults: [
                ExamResultModel(
                    id: "dsfadsfasdfasdfa",
                    studentId: "VBGPEULWgMexuvt6mfhrVIdyurp2",
                    studentName: "ahmed mohamed",
                    score: 0)
              ])
        ])
  ])
]);
