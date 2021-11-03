// ignore_for_file: file_names

import 'dart:async';

import 'package:alphabet_card_app/main.dart';
import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

List<String> capitalAlpha = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z',
];
List<String> smallAlpha = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z',
];
int count = 0;
bool num = false;

int seconds = 5;
int minutes = 0;
Timer _timer = Timer.periodic(const Duration(seconds: 1), (_) {});

class _PlayScreenState extends State<PlayScreen> {
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
              if (count < capitalAlpha.length - 1) {
                count++;
                seconds = 5;
                startTimer();
              }
            });
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen,
        drawer: Drawer(
          child: ListView(
            children: const [
              DrawerHeader(
                  decoration: BoxDecoration(color: Colors.lightGreen),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white70,
                    child: CircleAvatar(
                      radius: 44,
                      backgroundImage: AssetImage('images/card.png'),
                    ),
                  ))
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Play Time'),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      ' $seconds',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
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
              const SizedBox(
                height: 60,
              ),
              alphaCase == true
                  ? Text(
                      '${capitalAlpha[count]}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.w600),
                    )
                  : Text(
                      '${smallAlpha[count]}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.w600),
                    ),
              const SizedBox(
                height: 120,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FloatingActionButton(
                      elevation: 20,
                      backgroundColor: Colors.white70,
                      child: const Icon(
                        Icons.forward,
                        color: Colors.lightGreen,
                      ),
                      onPressed: () {
                        setState(() {
                          if (count < capitalAlpha.length - 1) {
                            count--;
                            seconds = 5;
                            startTimer();
                          }
                        });
                      }),
                  const SizedBox(
                    width: 120,
                  ),
                  FloatingActionButton(
                      elevation: 20,
                      backgroundColor: Colors.white70,
                      child: const Icon(
                        Icons.forward,
                        color: Colors.lightGreen,
                      ),
                      onPressed: () {
                        setState(() {
                          if (count < capitalAlpha.length - 1) {
                            count++;
                            seconds = 5;
                            startTimer();
                          }
                        });
                      }),
                ],
              ),
              num == false
                  ? FloatingActionButton(
                      elevation: 20,
                      backgroundColor: Colors.green,
                      child: const Icon(Icons.play_arrow),
                      onPressed: () {
                        setState(() {
                          count;
                          startTimer();

                          num = true;
                        });
                      })
                  : Container()
              //  FloatingActionButton(
              //     elevation: 20,
              //     backgroundColor: Colors.green,
              //     child: const Icon(Icons.pause),
              //     onPressed: () {
              //       setState(() {
              //         // count;
              //         // seconds = 5;
              //         num = false;
              //       });
              //     })
            ],
          ),
        ));
  }
}
