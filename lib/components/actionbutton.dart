import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,required this.title,required this.onTab
  }) : super(key: key);
  final String title;
    final Function onTab;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 50,
      child: ElevatedButton(onPressed: ()=>onTab(), child:  Text(title)),
    );
  }
}