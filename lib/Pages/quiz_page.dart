import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/Pages/result_page.dart';
import 'package:quiz_app/components/gradient_box.dart';
import 'package:quiz_app/models/question.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key, required this.totalTime, required this.questions})
      : super(key: key);
  final int totalTime;
  final List<QuestionDataModel> questions;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late int _currentTime;
  late Timer _timer;
  int _currentindex = 0;
  String _selectedAnswer = '';
  int _score = 0;

  @override
  void initState() {
    _currentTime = widget.totalTime;
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        print(_currentTime);
        _currentTime--;
        if (_currentTime == 0) {
          timer.cancel();
           pushResultscreen(context);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
   
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[_currentindex];
    return Scaffold(
      body: GradientBox(
          child: Container(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      LinearProgressIndicator(
                        value: _currentTime / widget.totalTime,
                      ),
                      Center(
                          child: Text(
                        _currentTime.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Question',
                style: TextStyle(fontSize: 20),
              ),
              Text(currentQuestion.question),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, indext) {
                    final ans = currentQuestion.answers[indext];
                    return AnswerTile(
                      isSelected: ans == _selectedAnswer,
                      answ: ans,
                      correctAnswer: currentQuestion.correctAnswer,
                      onTab: () {
                        setState(() {
                          _selectedAnswer = ans;
                        });
                        if (ans == currentQuestion.correctAnswer) {
                          _score++;
                        }
                        Future.delayed(const Duration(milliseconds: 100), () {
                          if (_currentindex == questionObjects.length - 1) {
                            pushResultscreen(context);
                          }
                          setState(() {
                            _currentindex++;
                            _selectedAnswer='';
                          });
                        });
                      },
                    );
                  },
                  itemCount: currentQuestion.answers.length,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  void pushResultscreen(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => ResultPage(
              totalQuestion: widget.questions.length,
              score: _score,
            )));
  }
}

class AnswerTile extends StatelessWidget {
  const AnswerTile(
      {Key? key,
      required this.isSelected,
      required this.answ,
      required this.correctAnswer,
      required this.onTab})
      : super(key: key);
  final bool isSelected;
  final String answ;
  final String correctAnswer;
  final Function onTab;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: ListTile(
        onTap: () => onTab(),
        title: Text(answ),
      ),
    );
  }

  Color get cardColor {
    if (!isSelected) return Colors.white;
    if (answ == correctAnswer) {
      return Colors.green;
    }
    return Colors.red;
  }
}
