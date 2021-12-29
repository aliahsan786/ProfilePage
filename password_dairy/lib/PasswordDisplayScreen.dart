import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:password_dairy/listOfPassword.dart';
import 'package:password_dairy/widget/new_password.dart';

class PasswordDisplayScreen extends StatelessWidget {
  const PasswordDisplayScreen({Key? key}) : super(key: key);
  void _newPasswordFunction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: newIncome(),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Password Screen")),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              color: Colors.purple,
              width: MediaQuery.of(context).size.width,
              child: const DrawerHeader(
                child: Text(
                  'Password Dairy',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _newPasswordFunction(context);
              },
              child: ListTile(
                title: Text('Add Password'),
                leading: Icon(Icons.password),
              ),
            )
          ],
        ),
      ),
      body: ListOfPassword(),
    );
  }
}
