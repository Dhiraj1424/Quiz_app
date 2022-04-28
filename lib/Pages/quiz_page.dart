import 'package:flutter/material.dart';
import 'package:quiz_app/components/gradient_box.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({ Key? key }) : super(key: key);

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
                    value: 0.1,
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