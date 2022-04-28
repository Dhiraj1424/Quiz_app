import 'package:flutter/material.dart';

class GradientBox extends StatelessWidget {
  const GradientBox({ Key? key, required this.child}) : super(key: key);
final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blueGrey,Colors.lightBlue]),
            
          ),
          child: child,
    );
  }
}