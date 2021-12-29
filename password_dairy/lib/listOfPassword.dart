import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class ListOfPassword extends StatelessWidget {
  DateTime dateTime = DateTime.now();
  String title = 'Nothing';
  DateTime firebaseDate = DateTime.now();
  String password = "";
  String itemId = 'abc';
  double totleSpent = 0;
  @override
  Widget build(BuildContext context) {
    Widget emptyList() {
      return LayoutBuilder(builder: (ctx, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              'No Transaction yet!...',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Container(
                height: constraints.maxHeight * 0.6,
                child: Image.asset(
                  'images/waiting.png',
                  fit: BoxFit.cover,
                )),
          ],
        );
      });
    }

    int x = 0;
    String year = dateTime.year.toString();
    final mediaQuery = MediaQuery.of(context);
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Dairy').snapshots(),
        builder: (ctx, streamSnapshort) {
          if (streamSnapshort.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final document = streamSnapshort.data!.docs;
          return document.length == 0
              ? emptyList()
              : ListView.builder(
                  itemCount: document.length,
                  itemBuilder: (ctx, index) {
                    title = document[index]['title'];
                    password = document[index]['Password'];
                    x = x + 1;

                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 5,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Container(
                            padding: EdgeInsets.all(6),
                            child: FittedBox(child: Text('$x')),
                          ),
                        ),
                        title: Text(
                          title,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        subtitle: Text('$password'),
                      ),
                    );
                  });
        });
  }
}
