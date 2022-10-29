import 'package:flutter/cupertino.dart';
import 'package:quizino/data/Category.dart';
import 'package:quizino/data/Question.dart';

List<Category> getCategoryList() {
  var categories = [
    Category(
      "ورزش",
      "۱۰",
      AssetImage("images/basketball.png"),
      getSportQuestionList(),
    ),
    Category(
      "علوم",
      "۱۰",
      AssetImage("images/chemistry.png"),
      getSienceQuestionList(),
    ),
    Category(
      "ریاضی",
      "۱۰",
      AssetImage("images/calculator.png"),
      getMathQuestionList(),
    ),
    // Category("تاریخ", "۱۰", AssetImage("images/calendar.png")),
    // Category("بیولوژی", "۱۰", AssetImage("images/dna.png")),
    // Category("جغرافیا", "۱۰", AssetImage("images/map.png")),
  ];
  return categories;
}

List<Qustion> getSportQuestionList() {
  var questions = [
    Qustion(
      "میزبان المپیک ۲۰۲۴ کدام کشور است؟",
      AssetImage("images/1.png"),
      ["روسیه", "قطر", "دانمارک", "آمریکا"],
      3,
    ),
    Qustion(
      "قهرمان جام‌جهانی ۲۰۱۴ که بود؟",
      AssetImage("images/2.png"),
      ["برزیل", "آلمان", "آرژانتین", "فرانسه"],
      1,
    )
  ];
  return questions;
}

List<Qustion> getSienceQuestionList() {
  var questions = [
    Qustion(
      "برای تجزیه نور چه نوری را به منشور می تابانند؟",
      AssetImage("images/3.png"),
      ["نور سفید", "نور قرمز", "نور آبی", "فرقی نمیکند"],
      0,
    ),
    Qustion(
      "U در فیزیک به چه معنی معناست؟",
      AssetImage("images/4.png"),
      [
        "شتاب گرانش زمین",
        "اختلاف پتانسیل",
        "انرژی الکتریکی",
        " انرژی پتانسیل گرانشی"
      ],
      3,
    )
  ];
  return questions;
}

List<Qustion> getMathQuestionList() {
  var questions = [
    Qustion(
      "ثلث خمس 45 برابر با چه عددی است؟",
      AssetImage("images/5.png"),
      ["۱", "۶", "۹", "۳"],
      3,
    ),
    Qustion(
      "جذر ۱۹۶ کدام است؟",
      AssetImage("images/6.png"),
      ["۱۳", "۱۴", "۱۵", "۱۶"],
      1,
    )
  ];
  return questions;
}
