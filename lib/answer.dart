import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Color answerColor;
  final Function answerTap;
  const Answer({ this.answerText, this.answerColor, this.answerTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answerTap,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.symmetric(vertical:5.0, horizontal:150.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: answerColor,
          //border: Border.all(color: Color(0xFFA72681),),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            answerText,
            style: const TextStyle(fontSize: 30.0),),
        ),
      ),
    );
  }
}
