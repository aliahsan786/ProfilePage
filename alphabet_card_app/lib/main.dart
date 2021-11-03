import 'package:alphabet_card_app/PlayScreen.dart';
import 'package:flutter/material.dart';

import 'SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
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

bool alphaCase = true;

class _MyHomePageState extends State<MyHomePage> {
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
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  alphaCase = true;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlayScreen()),
                  );
                },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white70,
                    ),
                    height: 75,
                    width: 250,
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Capital A-Z',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreen),
                        textAlign: TextAlign.center,
                      ),
                    ))),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
                onTap: () {
                  alphaCase = false;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlayScreen()),
                  );
                },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white70,
                    ),
                    height: 75,
                    width: 250,
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Small a-z',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreen),
                        textAlign: TextAlign.center,
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
