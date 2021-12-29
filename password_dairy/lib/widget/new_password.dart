import 'package:flutter/material.dart';
import 'package:password_dairy/DataStoreModels.dart';

// ignore: camel_case_types
class newIncome extends StatefulWidget {
  @override
  _newIncomeState createState() => _newIncomeState();
}

// ignore: camel_case_types
class _newIncomeState extends State<newIncome> {
  final _passwordController = TextEditingController();
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _submitData() {
      if (_passwordController.text.isEmpty) {
        return;
      }
      // ignore: unused_local_variable
      final enteredTitle = _titleController.text;
      // final enteredAmount = double.parse(_passwordController.text);

      final password = _passwordController.text;
      // final passwordamount = double.parse(_passwordController.text);
      if (_passwordController.text.isEmpty || _titleController.text.isEmpty) {
        return;
      }
      DataStoreModels().insertData(enteredTitle, password);
      Navigator.of(context).pop();
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
                // keyboardType: TextInputType.text,
                autofocus: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.attach_money),
                    labelText: 'Title or Discription'),
                controller: _titleController,

                onSubmitted: (_) => _submitData(),
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                // keyboardType: TextInputType.number,
                autofocus: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.attach_money), labelText: 'Password'),
                controller: _passwordController,

                onSubmitted: (_) => _submitData(),
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              ElevatedButton(
                onPressed: _submitData,
                child: Text('Add Net Income'),
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
