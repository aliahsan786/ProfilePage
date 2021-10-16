import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uipractice/Player.dart';

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
  int flage = 1;
  String player = 'Nutral';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('DiceApp'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.shade300,
        //1st player
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              player,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 14.0, right: 14.0, top: 0, bottom: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 14, right: 14, bottom: 14),
                          child: Column(
                            children: [
                              // Text(
                              //   'Player 1',
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.w500,
                              //     fontSize: 26,
                              //   ),
                              // ),
                              Container(
                                padding: EdgeInsets.all(6),
                                color: Colors.yellow,
                                child: GestureDetector(
                                  child: Player(number1, total1),
                                  onTap: () {
                                    if (flage == 1) {
                                      setState(
                                        () {
                                          index1 = 1 + index1;
                                          if (index1 < 11) {
                                            number1 = Random().nextInt(6) + 1;

                                            total1 = number1 + total1;

                                            print(index1);
                                            print(number1);
                                            print(total1);
                                            flage = 2;
                                            player = '2nd Player Turn';
                                          }
                                        },
                                      );
                                    }
                                  },
                                ),
                              ),
                              Playerbody(number1, total1)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 14, right: 14, bottom: 14),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(6),
                                color: Colors.green,
                                child: GestureDetector(
                                  child: Player(number2, total2),
                                  onTap: () {
                                    if (flage == 2) {
                                      setState(
                                        () {
                                          index2 = 1 + index2;
                                          if (index2 < 10) {
                                            number2 = Random().nextInt(6) + 1;

                                            total2 = number2 + total2;

                                            print(index2);
                                            print(number2);
                                            print(total2);
                                            flage = 3;
                                            player = '3rd Player Turn';
                                          }
                                        },
                                      );
                                    }
                                  },
                                ),
                              ),
                              Playerbody(number2, total2)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(6),
                                color: Colors.blue,
                                child: GestureDetector(
                                  child: Player(number3, total3),
                                  onTap: () {
                                    if (flage == 3) {
                                      setState(
                                        () {
                                          index3 = 1 + index3;
                                          if (index3 < 10) {
                                            number3 = Random().nextInt(6) + 1;

                                            total3 = number3 + total3;

                                            print(index3);
                                            print(number3);
                                            print(total3);
                                            flage = 4;
                                            player = '4th Player Turn';
                                          }
                                        },
                                      );
                                    }
                                  },
                                ),
                              ),
                              Playerbody(number3, total3)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(6),
                                color: Colors.red,
                                child: GestureDetector(
                                  child: Player(number4, total4),
                                  onTap: () {
                                    if (flage == 4) {
                                      setState(
                                        () {
                                          index4 = 1 + index4;
                                          if (index4 < 10) {
                                            number4 = Random().nextInt(6) + 1;

                                            total4 = number4 + total4;

                                            print(index4);
                                            print(number4);
                                            print(total4);
                                            flage = 1;
                                            player = '1st Player Turn';
                                          }
                                        },
                                      );
                                    }
                                  },
                                ),
                              ),
                              Playerbody(number4, total4)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: RaisedButton(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  color: Colors.amberAccent,
                  child: Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    width: MediaQuery.of(context).size.width / 2,
                    height: 22,
                    child: Text(
                      'Result Button',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
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
                  }),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
