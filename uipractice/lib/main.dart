import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Profile Page',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        backgroundColor: Color.fromRGBO(54, 54, 56, 0.5),
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width + 10,
              height: 300,

              decoration: BoxDecoration(
                color: Color.fromRGBO(54, 54, 56, 0.5),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(150.0),
                ),
              ),

              // child: Stack(
              //   children: [
              //     Text(
              //       'Profile',
              //       style: TextStyle(
              //         fontSize: 30,
              //         fontWeight: FontWeight.w600,
              //         color: Colors.white,
              //       ),
              //     ),
              //     // Container(
              //     //     width: 100,
              //     //     height: 100,
              //     //     child: Image.asset(
              //     //       'images/c1.png',
              //     //     )),
              //   ],
              // ),
            ),
            Expanded(child: Text('data'))
          ],
        ),
      ),
    );
  }
}
