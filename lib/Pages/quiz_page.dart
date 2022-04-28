import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/components/gradient_box.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({ Key? key }) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late int _currentTime;
  late Timer _timer;

  @override
  void initState() {
    _currentTime=10;
    super.initState();
    _timer=Timer.periodic(Duration(seconds: 1), (timer) { 
      
    setState(() {
       print(_currentTime);
      _currentTime--;
        if(_currentTime==0){
        timer.cancel();
       
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
    return Scaffold(
      body: GradientBox(child:Container(
        child: Padding(
           padding: EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(
                height: 30,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: LinearProgressIndicator(
                    value: _currentTime/10,
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}