import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

void result(String name, BuildContext context) {
  print(name);
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text(
              'Results',
              style: TextStyle(color: Colors.red.shade700),
            ),
            content: Text(
              'Winner is $name',
              style: TextStyle(color: Colors.blue),
            ),
          ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DiceApp(),
    );
  }
}

class DiceApp extends StatefulWidget {
  const DiceApp({Key? key}) : super(key: key);

  @override
  _DiceAppState createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int index1 = 0;
  int number1 = 1;
  int total1 = 0;
  int index2 = 0;
  int number2 = 1;
  int total2 = 0;
  int index3 = 0;
  int number3 = 1;
  int total3 = 0;
  int index4 = 0;
  int number4 = 1;
  int total4 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DiceApp'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.red.shade500,
        //1st player
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: Column(
                      children: [
                        Image.asset('images/dice$number1.png'),
                        Text(
                          ' Total : $total1',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Score : $number1',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        index1 = 1 + index1;
                        if (index1 < 11) {
                          number1 = Random().nextInt(6) + 1;

                          total1 = number1 + total1;

                          print(index1);
                          print(number1);
                          print(total1);
                        } else {}
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    child: Column(
                      children: [
                        Image.asset('images/dice$number2.png'),
                        Text(
                          ' Total : $total2',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Score : $number2',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        index2 = 1 + index2;
                        if (index2 < 10) {
                          number2 = Random().nextInt(6) + 1;

                          total2 = number2 + total2;

                          print(index2);
                          print(number2);
                          print(total2);
                        } else {}
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: Column(
                      children: [
                        Image.asset('images/dice$number3.png'),
                        Text(
                          ' Total : $total3',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Score : $number3',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        index3 = 1 + index3;
                        if (index3 < 10) {
                          number3 = Random().nextInt(6) + 1;

                          total3 = number3 + total3;

                          print(index3);
                          print(number3);
                          print(total3);
                        } else {}
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    child: Column(
                      children: [
                        Image.asset('images/dice$number4.png'),
                        Text(
                          ' Total : $total4',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Score : $number4',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        index4 = 1 + index4;
                        if (index4 < 10) {
                          number4 = Random().nextInt(6) + 1;

                          total4 = number4 + total4;

                          print(index4);
                          print(number4);
                          print(total4);
                        } else {}
                      });
                    },
                  ),
                ),
              ],
            ),
            RaisedButton(
                child: Text(
                  'Result Button',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                onPressed: () {
                  if (total1 > total2 && total1 > total3 && total1 > total4) {
                    result('player1', context);
                  }
                  if (total2 > total1 && total2 > total3 && total2 > total4) {
                    result('player2', context);
                  }
                  if (total3 > total2 && total3 > total1 && total3 > total4) {
                    result('player3', context);
                  }
                  if (total4 > total2 && total4 > total3 && total4 > total1) {
                    result('player4', context);
                  }
                })
          ],
        ),
      ),
    );
  }
}
