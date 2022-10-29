import 'package:flutter/cupertino.dart';
import 'package:quizino/data/Question.dart';

class Category {
  String? title;
  String? questionCount;
  ImageProvider? image;
  List<Qustion>? questionList;

  Category(
    this.title,
    this.questionCount,
    this.image,
    this.questionList,
  );
}
