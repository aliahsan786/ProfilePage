import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String password;
  DetailScreen(this.title, this.password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Title and Passwrod',
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 40,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30,
            ),
            Text(password,
                style: const TextStyle(
                    fontSize: 40,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
