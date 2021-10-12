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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width + 200,
                height: 150,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(54, 54, 56, 0.5),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(7050, 2050),
                  ),
                ),
                child: Container(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Container(
                  //     width: 100,
                  //     height: 100,
                  //     child: Image.asset(
                  //       'images/c1.png',
                  //     )),
                ),
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: ExactAssetImage('images/c1.png'),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Username',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                      ),
                    ),
                  ),
                  Container(
                    height: 50, width: MediaQuery.of(context).size.width - 40,
                    color: Color.fromRGBO(54, 54, 56, 0.5),
                    // padding: const EdgeInsets.only(top: 20),
                    child: MaterialButton(
                      // height: 30,
                      onPressed: () {},
                      child: Text(
                        'Update',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
