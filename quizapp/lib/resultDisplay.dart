// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:quizapp/main.dart';

class ResutDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(25, 29, 42, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(33, 44, 59, 1),
        title: const Text('Start Screen'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white70),
              width: 225,
              height: 60,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Total Question : $listLenth',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(33, 44, 59, 1),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white70),
              width: 225,
              height: 60,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Total Time :  $minutes:$seconds',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(33, 44, 59, 1),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white70),
              width: 225,
              height: 60,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Total Marks : ${listLenth * 2}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(33, 44, 59, 1),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            MaterialButton(
                minWidth: 225,
                height: 60,
                color: Colors.orangeAccent,
                child: const Text(
                  'Start',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromRGBO(33, 44, 59, 1),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizApp()),
                  );
                })
          ],
        ),
      ),
    );
  }
}
