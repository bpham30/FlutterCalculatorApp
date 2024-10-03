import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculator App',
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  //init vars
  String output = '0';
  String operator = '';
  double num1 = 0;
  double num2 = 0;
  bool isOperatorClicked = false;

  //function to handle button click
  void _clickBtn(String btnFunc) {
    setState(() {
      //clear output
      if (btnFunc == 'C') {
        output = '0';
        num1 = 0;
        num2 = 0;
        operator = '';
        //handle all operators
      } else if (btnFunc == '+' ||
          btnFunc == '-' ||
          btnFunc == '*' ||
          btnFunc == '/') {
        num1 = double.parse(output);
        operator = btnFunc;
        isOperatorClicked = true;
        //handle equals
      } else if (btnFunc == '=') {
        num2 = double.parse(output);
        _calculate();
        isOperatorClicked = true;
      }
      //handle nuymbers
      else {
        if (isOperatorClicked) {
          output = btnFunc;
          isOperatorClicked = false;
        } else {
          if (output == '0') {
            output = btnFunc;
          } else {
            output = output + btnFunc;
          }
        }
      }
    });
  }

  void _calculate() {
    double res = 0;
    switch (operator) {
      case '+':
        res = num1 + num2;
        break;
      case '-':
        res = num1 - num2;
        break;
      case '*':
        res = num1 * num2;
        break;
      case '/':
        //check for division by 0
        if (num2 == 0) {
          setState(() {
            output = 'Error'; //display error
          });
          return;
        } else{
          res = num1 / num2;
        }
        break;
      default:
        return;
    }
    setState(() {
      //return as whole number if no decimal
     if (res == res.toInt()){
        output = res.toInt().toString();
     } else {
       output = res.toString();
     }
     num1 = 0;
      num2 = 0;
      operator = '';
    });
  }
  @override
Widget build(BuildContext context,) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.deepOrange,
      title: const Text('Calculator App'),
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //ui for display area
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(20),
            child: Text(
              output,
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        //ui for buttons
        Column(
          children: [
            Row(
              children: [
                button('7'),
                button('8'),
                button('9'),
                button('/'),
              ],
            ),
            Row(
              children: [
                button('4'),
                button('5'),
                button('6'),
                button('*'),
              ],
            ),
            Row(
              children: [
                button('1'),
                button('2'),
                button('3'),
                button('-'),
              ],
            ),
            Row(
              children: [
                button('C'),
                button('0'),
                button('='),
                button('+'),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

//function to create button
Widget button(String btnFunc) {
  return InkWell(
      onTap: () {
        //handle button click
        _clickBtn(btnFunc);
      },
      //btn styles
      child: Container(
        height: 65,
        width: 65,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.deepOrange,
        ),
        //btn text
        child: Text(
          btnFunc,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ));
}
}


