import 'package:calculator/calculatorButton.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  static const String route_name = 'calculator_screen';

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                color: Color(0xFFE5EAE7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        text,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: 60,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  onDigitClick,
                  text: 'AC',
                  textColor: Colors.grey,
                  buttonColor: Color(0xFFE5EAE7),
                ),
                CalculatorButton(onDigitClick,
                    text: '+/-',
                    textColor: Colors.grey,
                    buttonColor: Color(0xFFE5EAE7)),
                CalculatorButton(onDigitClick,
                    text: '%',
                    textColor: Colors.grey,
                    buttonColor: Color(0xFFE5EAE7)),
                CalculatorButton(onDigitClick,
                    text: '÷',
                    textColor: Colors.pink,
                    buttonColor: Color(0xFFE5EAE7)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(onDigitClick,
                    text: '7',
                    textColor: Color(0xff3223f0),
                    buttonColor: Color(0xFFE5EAE7)),
                CalculatorButton(onDigitClick,
                    text: '8',
                    textColor: Color(0xff3223f0),
                    buttonColor: Color(0xFFE5EAE7)),
                CalculatorButton(onDigitClick,
                    text: '9',
                    textColor: Color(0xff3223f0),
                    buttonColor: Color(0xFFE5EAE7)),
                CalculatorButton(onDigitClick,
                    text: 'x',
                    textColor: Colors.pink,
                    buttonColor: Color(0xFFE5EAE7)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(onDigitClick,
                    text: '4',
                    textColor: Color(0xff3223f0),
                    buttonColor: Color(0xFFE5EAE7)),
                CalculatorButton(onDigitClick,
                    text: '5',
                    textColor: Color(0xff3223f0),
                    buttonColor: Color(0xFFE5EAE7)),
                CalculatorButton(onDigitClick,
                    text: '6',
                    textColor: Color(0xff3223f0),
                    buttonColor: Color(0xFFE5EAE7)),
                CalculatorButton(onDigitClick,
                    text: '-',
                    textColor: Colors.pink,
                    buttonColor: Color(0xFFE5EAE7)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(onDigitClick,
                    text: '1',
                    textColor: Color(0xff3223f0),
                    buttonColor: Color(0xFFE5EAE7)),
                CalculatorButton(onDigitClick,
                    text: '2',
                    textColor: Color(0xff3223f0),
                    buttonColor: Color(0xFFE5EAE7)),
                CalculatorButton(onDigitClick,
                    text: '3',
                    textColor: Color(0xff3223f0),
                    buttonColor: Color(0xFFE5EAE7)),
                CalculatorButton(onDigitClick,
                    text: '+',
                    textColor: Colors.pink,
                    buttonColor: Color(0xFFE5EAE7)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){
                    onDigitClick('0');
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(28, 12, 90, 12),
                    child: Text(
                      "0",
                      style: TextStyle(
                        fontSize: 35,
                        color: Color(0xff3223f0),
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: Color(0xFFE5EAE7),
                  ),
                ),
                CalculatorButton(onDigitClick,
                    text: '.',
                    buttonColor: Color(0xFFE5EAE7),
                    textColor: Color(0xff3223f0)),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.pinkAccent, Colors.pink, Colors.purple])),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(70, 70),
                        shape: CircleBorder(),
                        primary: Colors.transparent),
                    onPressed: (){
                      onDigitClick('=');
                    },
                    child: Text(
                      '=',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ));
  }

  // Logic
  int firstNumber = 0;
  int secondNumber = 0;
  String result = "";
  String text = "";
  String operation = "";
  onDigitClick( btnText) {
    if (btnText == "AC") {
      result = "";
      text = "";
      firstNumber = 0;
      secondNumber = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "÷") {
      firstNumber = int.parse(text);
      result = "";
      operation = btnText;
    } else if (btnText == "=") {
      secondNumber = int.parse(text);
      if (operation == "+") {
        result = (firstNumber + secondNumber).toString();
      }
      if (operation == "-") {
        result = (firstNumber - secondNumber).toString();
      }
      if (operation == "x") {
        result = (firstNumber * secondNumber).toString();
      }
      if (operation == "÷") {
        result = (firstNumber ~/ secondNumber).toString();
      }
    } else {
      result = int.parse(text + btnText).toString();
    }
    setState(() {
      text = result;
    });
  }
}

