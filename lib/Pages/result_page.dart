import 'package:flutter/material.dart';
import 'package:quiz_app/Pages/homepage.dart';
import 'package:quiz_app/Pages/quiz_page.dart';
import 'package:quiz_app/components/actionbutton.dart';
import 'package:quiz_app/components/gradient_box.dart';
import 'package:quiz_app/models/question.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.score, required this.totalQuestion})
      : super(key: key);
  final int score;
  final int totalQuestion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
      child: GradientBox(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Result: $score/$totalQuestion'),
            const SizedBox(
              height: 50,
              width: 50,
            ),
            ActionButton(
                title: 'Play again',
                onTab: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => QuizPage(
                        totalTime: 10,
                        questions:questionObjects
                      )));
                })
          ],
        ),
      )),
    ));
  }
}
