import 'package:flutter/cupertino.dart';

class Qustion {
  String? questionTitle;
  ImageProvider? image;
  List<String>? answerList;
  int? correctAnswer;

  Qustion(
    this.questionTitle,
    this.image,
    this.answerList,
    this.correctAnswer,
  );
}
