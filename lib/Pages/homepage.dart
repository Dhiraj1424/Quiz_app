import 'package:flutter/material.dart';
import 'package:quiz_app/Pages/quiz_page.dart';
import 'package:quiz_app/components/gradient_box.dart';
class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: GradientBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
              Text('Quiz',),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>QuizPage()));
              }, child: const Text('Start'))
            ],
          ),
        ),
      ),

    );
  }
}