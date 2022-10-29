import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizino/constants/constants.dart';
import 'package:quizino/data/Question.dart';

class QuizScreen extends StatefulWidget {
  List<Qustion> questionList;
  QuizScreen(this.questionList, {super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState(questionList);
}

class _QuizScreenState extends State<QuizScreen> {
  List<Qustion> questionList;
  int shownQuestionIndex = 0;
  Qustion? currentQuestion;
  bool isFinalAnswerSubmited = false;
  int correctAnswer = 0;
  bool answerSubmited = false;

  _QuizScreenState(this.questionList);

  @override
  Widget build(BuildContext context) {
    currentQuestion = questionList[shownQuestionIndex];
    return Scaffold(
      body: SafeArea(
        child: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    return Center(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "سوال ${shownQuestionIndex + 1} از ${questionList.length}",
              style: TextStyle(
                fontSize: 14,
                color: grey,
              ),
            ),
            Text(
              currentQuestion!.questionTitle!,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 24,
            ),
            Image(
              image: currentQuestion!.image!,
            ),
            SizedBox(
              height: 24,
            ),
            Column(
              children: [
                ...List.generate(4, (index) => _getOptionsItem(index)),
                if (answerSubmited)
                  Padding(
                    padding: EdgeInsets.only(top: 24, left: 8, right: 8),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (shownQuestionIndex < questionList.length - 1) {
                            answerSubmited = false;
                            shownQuestionIndex++;
                          }
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          isFinalAnswerSubmited
                              ? "مشاهده نتیجه کوییز"
                              : "سوال بعدی",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getOptionsItem(int index) {
    return GestureDetector(
      onTap: () {
        _checkAnswer(index);
      },
      child: Card(
        elevation: 0,
        color: answerSubmited
            ? _checkSelectedOption(index)
                ? blueLight
                : redLight
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            width: 1,
            color: answerSubmited
                ? _checkSelectedOption(index)
                    ? blue
                    : red
                : grey,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                currentQuestion!.answerList![index],
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              answerSubmited
                  ? _checkSelectedOption(index)
                      ? SvgPicture.asset(
                          "images/correct.svg",
                        )
                      : SvgPicture.asset(
                          "images/wrong.svg",
                        )
                  : SvgPicture.asset(
                      "images/oval.svg",
                      color: grey,
                    )
            ],
          ),
        ),
      ),
    );
  }

  void _checkAnswer(int index) {
    setState(() {
      answerSubmited = true;
    });

    if (shownQuestionIndex == questionList.length - 1) {
      isFinalAnswerSubmited = true;
    }

    // Future.delayed(Duration(milliseconds: 800), () {
    //   setState(() {
    //     if (shownQuestionIndex < questionList.length - 1) {
    //       answerSubmited = false;
    //       shownQuestionIndex++;
    //     }
    //   });
    // });
  }

  bool _checkSelectedOption(int index) {
    if (currentQuestion!.correctAnswer == index) {
      correctAnswer++;
      return true;
    } else {
      return false;
    }
  }
}
