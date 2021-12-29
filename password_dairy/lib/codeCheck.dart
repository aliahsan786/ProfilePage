import 'package:flutter/material.dart';
import 'package:password_dairy/DataStoreModels.dart';
import 'package:password_dairy/DetailScreen.dart';

// ignore: camel_case_types
class CheckBox extends StatefulWidget {
  // final Function adx;
  final String title;
  final String password;
  CheckBox(this.title, this.password);
  @override
  _CheckBoxState createState() => _CheckBoxState();
}

// ignore: camel_case_types
class _CheckBoxState extends State<CheckBox> {
  final _pinController = TextEditingController();

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Add a Correct Value!"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    void _submitData() {
      if (_pinController.text.isEmpty) {
        return;
      }
      // ignore: unused_local_variable
      final enteredTitle = _pinController.text;
      final enteredAmount = double.parse(_pinController.text);

      // final passwordamount = double.parse(_passwordController.text);
      if (_pinController.text.isEmpty ||
          enteredAmount == 0 ||
          _pinController.text != '12345') {
        return showAlert(context);
      }
      // widget.adx();

      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => DetailScreen(widget.title, widget.password)));
    }

    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.number,
                autofocus: true,
                decoration:
                    InputDecoration(icon: Icon(Icons.pin), labelText: 'Pin'),
                controller: _pinController,

                onSubmitted: (_) => _submitData(),
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              ElevatedButton(
                onPressed: _submitData,
                child: Text('Add Pin'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
