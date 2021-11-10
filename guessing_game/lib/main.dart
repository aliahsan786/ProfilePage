// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guessing_game/SplashScreen.dart';

import 'package:restart_app/restart_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

void restartapp(BuildContext context) {
  Restart.restartApp(webOrigin: '[your main route]');
  Navigator.of(context).pop();
}

int randmNumber = 0;
int upRange = 7;
int lowRange = 0;
final myController = TextEditingController();
List<Icon> inputValues = [];
int widgetcontrol = 0;
int count = 0;

class _MyHomePageState extends State<MyHomePage> {
  void gameLost(BuildContext context, int num) {
    if (count > 1) {
      Alert(
        context: context,
        title: 'Lost',
        desc: 'Opps! You Lost the game,  The Right number was $num',
      ).show();
      widgetcontrol = 0;
    }
    count++;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void randomNumber() {
    randmNumber = Random().nextInt(upRange + 1);
    if (randmNumber > upRange || randmNumber < lowRange) {
      randomNumber();
    } else {
      setState(() {
        randmNumber;
      });
    }
  }

  void newRange() {
    upRange = Random().nextInt(16);
    if (upRange < 7) {
      upRange = upRange + 7;
      lowRange = upRange - 7;
    } else {
      lowRange = upRange - 7;
    }
    setState(() {
      upRange;
      lowRange;
    });
    randomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Text(
          'Kids Guess Game',
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Material(
              elevation: 4,
              child: DrawerHeader(
                decoration: const BoxDecoration(color: Colors.lightGreen),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white70,
                  child: Center(
                      child: ClipOval(
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.grey.shade200,
                      child: Image.asset(
                        'images/guess.jpg',
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )),
                ),
              ),
            ),
            Material(
              elevation: 4,
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  newRange();
                  setState(() {
                    widgetcontrol = 1;
                    inputValues = [];
                  });
                },
                leading: const Icon(Icons.task_alt),
                title: const Text(
                  'Easy',
                  style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Material(
              elevation: 4,
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  newRange();
                  setState(() {
                    widgetcontrol = 2;
                    inputValues = [];
                  });
                },
                leading: const Icon(Icons.task_alt),
                title: const Text(
                  'Tough',
                  style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Material(
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.restart_alt),
                title: const Text(
                  'Restart Game',
                  style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  restartapp(context);
                },
              ),
            ),
          ],
        ),
      ),
      // ignore: sized_box_for_whitespace
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(
              height: 20,
            ),
            widgetcontrol == 0
                ? const Text(
                    'Number Gussing Game',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  )
                : Container(),
            widgetcontrol == 1
                ? const Text(
                    'Easy Mode',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  )
                : Container(),
            widgetcontrol == 2
                ? const Text(
                    'Tough Mode',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  )
                : Container(),
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Divider(
                color: Colors.black54,
                thickness: 2,
                height: 10,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Select an option from Drawer to play',
              style: TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'You will have to Guess a number between 3 tries',
              style: TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            widgetcontrol == 2
                ? const Text(
                    'In this You need to Guess number between 1-15',
                    style: TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  )
                : Container(),
            const SizedBox(
              height: 30,
            ),
            widgetcontrol == 1 || widgetcontrol == 2
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      widgetcontrol == 2
                          ? Container()
                          : Expanded(
                              flex: 1,
                              child: Text(
                                '$lowRange',
                                style: TextStyle(
                                  fontSize: 30,
                                  // fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                      Expanded(
                        flex: 2,
                        child: Material(
                          elevation: 10,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: Colors.lightGreen
                                // shape: BoxShape.rectangle,
                                ),
                            child: Text(
                              '?',
                              // textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 1.5,
                                fontSize: 50,
                                // fontWeight: FontWeight.w600,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      widgetcontrol == 2
                          ? Container()
                          : Expanded(
                              flex: 1,
                              child: Text(
                                '$upRange',
                                style: TextStyle(
                                  fontSize: 30,
                                  // fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                    ],
                  )
                : Container(),
            SizedBox(
              height: 30,
            ),
            widgetcontrol == 1 || widgetcontrol == 2
                ? TextField(
                    controller: myController,
                    maxLines: 1,
                    style: TextStyle(fontSize: 17),
                    textAlignVertical: TextAlignVertical.center,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered,
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.search,
                          color: Theme.of(context).iconTheme.color),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      fillColor: Colors.white70,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Enter The number in Range',
                    ),
                  )
                : Container(),
            SizedBox(
              height: 30,
            ),
            widgetcontrol == 1 || widgetcontrol == 2
                ? MaterialButton(
                    elevation: 5,
                    textColor: Colors.lightGreen,
                    onPressed: () {
                      try {
                        if (int.parse(myController.text) == randmNumber) {
                          setState(() {
                            inputValues.add(Icon(Icons.check));
                            myController.clear();
                            Alert(
                              context: context,
                              title: 'Win!!',
                              desc: 'You won this Round',
                            ).show();
                            widgetcontrol = 0;
                          });
                        } else {
                          setState(() {
                            inputValues.add(Icon(Icons.close));
                            myController.clear();
                            gameLost(context, randmNumber);
                          });
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 300,
                        color: Colors.blue,
                        child: Text(
                          'Submit',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black87),
                        )),
                  )
                : Container(),
            Row(children: inputValues),
          ],
        ),
      ),
    );
  }
}
