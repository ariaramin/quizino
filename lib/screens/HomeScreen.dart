import 'package:flutter/material.dart';
import 'package:quizino/constants/constants.dart';
import 'package:quizino/data/DataSet.dart';
import 'package:quizino/screens/QuizScreen.dart';
import 'package:quizino/widgets/CategoryCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: _getBody(context),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            _getTopSection(),
            SizedBox(
              height: 18,
            ),
            _getScoreBoard(),
            _getCategories(context),
          ],
        ),
      ),
    );
  }

  Widget _getTopSection() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            width: 62,
            height: 62,
            child: CircleAvatar(
              backgroundImage: AssetImage("images/boy.png"),
              backgroundColor: Colors.blue[50],
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "خوش آمدید",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "بیایید این روز را پربار کنیم",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getScoreBoard() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 32,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("images/trophy.png"),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    children: [
                      Text(
                        "رنکینگ",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "۲۳۵",
                        style: TextStyle(
                          fontSize: 14,
                          color: blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("images/coin.png"),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    children: [
                      Text(
                        "امتیاز",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "۱۲۳۵",
                        style: TextStyle(
                          fontSize: 14,
                          color: blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getCategories(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(
          //   width: double.infinity,
          // ),
          Text(
            "شروع کنید!",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Wrap(
            spacing: 22,
            runSpacing: 22,
            children: [
              ...List.generate(
                getCategoryList().length,
                (index) {
                  return CategoryCard(getCategoryList()[index]);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
