import 'package:flutter/material.dart';

class Practice extends StatelessWidget {
  // const Practice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            child: Text('data'),
          ),
        ),
      ),
    );
  }
}
