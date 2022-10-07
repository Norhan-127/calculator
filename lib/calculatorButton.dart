import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color textColor, buttonColor;
  Function onBtnClick;

  CalculatorButton(
    this.onBtnClick, {
    required this.text,
    required this.textColor,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(70, 70),
        shape: CircleBorder(),
        primary: buttonColor,
      ),
      onPressed: () {
        onBtnClick(text);
      },
      child: Text(
        text,
        style: TextStyle(
          // fontWeight: FontWeight.bold,
          fontSize: 25,
          color: textColor,
        ),
      ),
    );
  }
}
