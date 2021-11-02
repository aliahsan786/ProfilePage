import 'dart:async';
import 'dart:math';

import 'dart:ui';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:flutter/material.dart';
import 'package:quizapp/SplashScreen.dart';
import 'Question.dart';
import 'QuizQuestion.dart';
import 'resultDisplay.dart';

QuizQuestion quizQuestion = QuizQuestion();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuizApp',
      theme: ThemeData(),
      home: SplashScreen(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

////-------------Variable-------------////
List<Icon> iconList = [
  const Icon(
    Icons.arrow_forward,
    color: Colors.white,
  )
];
List<Question> rightAnswers = [];
List<Question> wrongAnswers = [];
List<Question> dumList = [];
int listLenth = quizQuestion.questionBank.length;
int count = 1;
int randmNumber = Random().nextInt(listLenth);
int obtainMarks = 0;
bool listFinished = true;
int totalQuestion = quizQuestion.questionBank.length;
int remainQuestion = quizQuestion.questionBank.length;
String question = quizQuestion.getQuestion(randmNumber);
int seconds = 00;
int minutes = quizQuestion.questionBank.length ~/ 2;
Timer _timer = Timer.periodic(const Duration(seconds: 1), (_) {});

class _QuizAppState extends State<QuizApp> {
/////------Random Number----------////
  void randomNumber() {
    // ignore: unnecessary_null_comparison
    if (listLenth != null) {
      randmNumber = Random().nextInt(listLenth);
    }
  }

//down navigator to next screen
  getItemAndNavigate(BuildContext context) {
    Navigator.push(
      // ignore: prefer_const_constructors
      context,
      MaterialPageRoute(builder: (context) => SplashScreen()),
    );
  }
//uper navigator to next Screen

  void startTimer() {
    // ignore: unnecessary_null_comparison
    if (_timer != null) {
      _timer.cancel();
    }
    if (minutes > 0) {
      seconds = minutes * 60;
    }
    if (seconds > 0) {
      minutes = (seconds / 60).floor();
      seconds -= (minutes * 60);
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          if (minutes > 0) {
            seconds = 59;
            minutes--;
          } else {
            _timer.cancel();
            // ignore: avoid_print
            print('Timer is completed');
            setState(() {
              listFinished = false;
            });
          }
        }
      });
    });
  }

  void checkAnswer(bool userValue) {
    // ignore: unnecessary_null_comparison
    if (listLenth != 0 || listFinished != false) {
      if (userValue == quizQuestion.rightBoolvalue(randmNumber)) {
        rightAnswers.add(quizQuestion.questionBank[randmNumber]);
        dumList.add(quizQuestion.questionBank[randmNumber]);
        quizQuestion.questionBank.removeAt(randmNumber);
        // randomNumber();
        setState(() {
          quizQuestion.checkIcon();
          listLenth = quizQuestion.questionBank.length;

          if (listLenth != 0) {
            randmNumber = Random().nextInt(listLenth);
            count++;
            question = quizQuestion.getQuestion(randmNumber);
          } else {
            listFinished = false;
          }

          print('random number $randmNumber');
          print('count $count');
          print('listlenth $listLenth');
          print(question);
        });
      } else {
        wrongAnswers.add(quizQuestion.questionBank[randmNumber]);
        dumList.add(quizQuestion.questionBank[randmNumber]);
        quizQuestion.questionBank.removeAt(randmNumber);
        // randomNumber();
        setState(() {
          quizQuestion.closeIcon();
          quizQuestion;
          listLenth = quizQuestion.questionBank.length;
          if (listLenth != 0) {
            randmNumber = Random().nextInt(listLenth);
            count++;

            question = quizQuestion.getQuestion(randmNumber);
          } else {
            listFinished = false;
          }

          print('random number $randmNumber');
          print('count $count');
          print('listlenth $listLenth');
          print(question);
        });
      }
    } else {
      quizQuestion.questionBank = dumList;
      Alert(context: context, title: 'Completed', desc: 'Your Quiz solved')
          .show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(33, 44, 59, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white70,
                      child: CircleAvatar(
                          radius: 42,
                          backgroundImage: AssetImage('images/quiz.png')),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Quiz info',
                      style: TextStyle(color: Colors.white70, fontSize: 25),
                    ),
                  )
                ],
              ),
            ),
            const ListTile(
              tileColor: Colors.white70,
              hoverColor: Colors.white70,
              selectedTileColor: Colors.red,
              focusColor: Colors.white70,
              leading: Icon(
                Icons.check,
                color: Color.fromRGBO(25, 29, 42, 1),
                size: 30,
              ),
              title: Text(
                'Totel Questions',
                style: TextStyle(
                  color: Color.fromRGBO(25, 29, 42, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const ListTile(
              tileColor: Colors.white70,
              hoverColor: Colors.white70,
              selectedTileColor: Colors.red,
              focusColor: Colors.white70,
              leading: Icon(
                Icons.check,
                color: Color.fromRGBO(25, 29, 42, 1),
                size: 30,
              ),
              title: Text(
                'Correct Answers',
                style: TextStyle(
                  color: Color.fromRGBO(25, 29, 42, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const ListTile(
              tileColor: Colors.white70,
              hoverColor: Colors.white70,
              selectedTileColor: Colors.red,
              focusColor: Colors.white70,
              leading: Icon(
                Icons.check,
                color: Color.fromRGBO(25, 29, 42, 1),
                size: 30,
              ),
              title: Text(
                'Wrong Answers',
                style: TextStyle(
                  color: Color.fromRGBO(25, 29, 42, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(33, 44, 59, 1),
        title: const Text('QuizApp'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromRGBO(25, 29, 42, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quiz : $listLenth / $totalQuestion',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        width: 175,
                      ),
                      Text(
                        '$minutes : $seconds',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 70, bottom: 70, left: 25, right: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white70,
                      ),
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(
                          question,
                          style: const TextStyle(
                              color: Color.fromRGBO(33, 44, 59, 1),
                              // backgroundColor: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      // left: MediaQuery.of(context).size.width / 2,
                      top: 20,
                      child: CircleAvatar(
                        radius: 34,
                        backgroundColor: Colors.white30,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: const Color.fromRGBO(33, 44, 59, 1),
                          child: Text(
                            '$count',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: MaterialButton(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 10, bottom: 10),
                color: Colors.white70,
                onPressed: () {
                  checkAnswer(true);

                  // ignore: avoid_print
                  print(quizQuestion.questionBank.length);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                minWidth: 320,
                height: 40,
                child: const Text(
                  'True',
                  style: TextStyle(
                      color: Color.fromRGBO(33, 44, 59, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 30),
              child: MaterialButton(
                elevation: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 10, bottom: 10),
                color: Colors.white70,
                onPressed: () {
                  checkAnswer(false);
                  // ignore: avoid_print
                  print(quizQuestion.questionBank.length);
                },
                minWidth: 320,
                height: 40,
                child: const Text(
                  'False',
                  style: TextStyle(
                      color: Color.fromRGBO(33, 44, 59, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: iconList,
            ),
          ],
        ),
      ),
    );
  }
}
