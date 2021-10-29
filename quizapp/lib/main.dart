import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuizApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuizApp(),
    );
  }
}

List<Icon> iconList = [];

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuizApp'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              flex: 6,
              child: Center(
                child: Text(
                  'Quiz Quiestion will be here',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 5),
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    iconList.add(
                      const Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 20,
                      ),
                    );
                  });
                },
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    color: Colors.blue,
                    child: const Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 5),
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    iconList.add(
                      const Icon(
                        Icons.close,
                        color: Colors.red,
                        size: 20,
                      ),
                    );
                  });
                },
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    color: Colors.blue,
                    child: const Text(
                      'False',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )),
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
