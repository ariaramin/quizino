import 'package:flutter/material.dart';
import 'package:quizino/data/Category.dart';

import '../screens/QuizScreen.dart';

class CategoryCard extends StatelessWidget {
  Category category;
  CategoryCard(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => QuizScreen(category.questionList!),
          ),
        );
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 28,
          ),
          child: Column(
            children: [
              Image(
                image: category.image!,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                category.title!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                category.questionCount! + " سوال",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
