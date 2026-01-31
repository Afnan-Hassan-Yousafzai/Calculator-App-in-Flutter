import 'package:calculator/top_buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'Components.dart';
import 'Constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: AutoSizeText(
                          userInput,
                          minFontSize: 20, // It won't get smaller than this
                          maxLines: 1, // Keep it on one line
                          style: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      AutoSizeText(
                        answer.toString(),
                        minFontSize: 20, // It won't get smaller than this
                        maxLines: 1, // Keep it on one line
                        style: TextStyle(
                          fontSize: 73,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TopButtons(
                              req: "AC",
                              onTab: () {
                                setState(() {
                                  userInput = '';
                                  answer = '0';
                                });
                              },
                            ),
                            TopButtons(
                              req: "+/-",
                              onTab: () {
                                if (userInput.isNotEmpty) {
                                  // 2. If it starts with '-', remove it
                                  if (userInput.startsWith('-')) {
                                    userInput = userInput.substring(1);
                                  }
                                  // 3. Otherwise, add '-' to the start
                                  else {
                                    userInput = '-' + userInput;
                                  }
                                }

                                setState(() {});
                              },
                            ),
                            TopButtons(
                              req: "%",
                              onTab: () {
                                userInput += '%';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              req: "/",
                              color: orange,
                              onTab: () {
                                userInput += '/';
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MyButton(
                              req: "7",
                              onTab: () {
                                userInput += '7';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              req: "8",
                              onTab: () {
                                userInput += '8';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              req: "9",
                              onTab: () {
                                userInput += '9';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              req: "x",
                              color: orange,
                              onTab: () {
                                userInput += 'x';

                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MyButton(
                              req: "4",
                              onTab: () {
                                userInput += '4';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              req: "5",
                              onTab: () {
                                userInput += '5';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              req: "6",
                              onTab: () {
                                userInput += '6';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              req: "-",
                              color: orange,
                              onTab: () {
                                userInput += '-';
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MyButton(
                              req: "1",
                              onTab: () {
                                userInput += '1';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              req: "2",
                              onTab: () {
                                userInput += '2';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              req: "3",
                              onTab: () {
                                userInput += '3';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              req: "+",
                              color: orange,
                              onTab: () {
                                userInput += '+';
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MyButton(
                              req: "0",
                              onTab: () {
                                userInput += '0';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              req: ".",
                              onTab: () {
                                userInput += '.';
                                setState(() {});
                              },
                            ),
                            MyButton(
                              req: "DEL",
                              onTab: () {
                                userInput = userInput.substring(
                                  0,
                                  userInput.length - 1,
                                );
                                setState(() {});
                              },
                            ),
                            MyButton(
                              req: "=",
                              color: orange,
                              onTab: () {
                                onPress();
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text('Developed by AFNAN', style: TextStyle(color: white, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }

  void onPress() {
    // ignore: deprecated_member_use
    Parser p = Parser();
    Expression exp = p.parse(userInput.replaceAll('x', '*'));
    ContextModel cm = ContextModel();
    // ignore: deprecated_member_use
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}
