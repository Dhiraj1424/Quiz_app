import 'package:flutter/material.dart';
import 'package:quiz_app/components/gradient_box.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GradientBox(child: Text('result'))
    );
  }
}