import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:online_exams_system/models/chapter%20model.dart';

Chapter pageChapter = Chapter();

class ChapterDetailsPage extends StatefulWidget {
  ChapterDetailsPage(Chapter selectedChapter) {
    pageChapter = selectedChapter;
  }

  @override
  State<ChapterDetailsPage> createState() => _ChapterDetailsPageState();
}

class _ChapterDetailsPageState extends State<ChapterDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
