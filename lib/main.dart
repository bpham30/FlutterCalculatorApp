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
  @override
  Widget build(BuildContext context) {
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
              child: const Text(
                '0',
                style: TextStyle(
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
  Widget button(String value) {
    return InkWell(
      onTap: () {
        //handle button click
      },
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
       
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            
          ),
        ),
      )
    );
  }
}
