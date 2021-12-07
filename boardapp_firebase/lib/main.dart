import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/rendering.dart';
import 'Module/board.dart';

void main() {
  runApp(const MyApp());
}

bool hel = true;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
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

class _MyHomePageState extends State<MyHomePage> {
  List<Board> boardMessages = [];
  Board? board;

  final FirebaseDatabase database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  DatabaseReference? databaseReference;

  @override
  void initState() {
    super.initState();
    board = Board("", "", "");
    databaseReference = database.reference().child('board_app');
    databaseReference!.onChildAdded.listen(_onEntryAdded);
    databaseReference!.onChildChanged.listen(_onEntryChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Board App'),
      ),
      body: Column(
        children: [
          Flexible(
              flex: 0,
              child: Center(
                child: Form(
                  key: formkey,
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.subject,
                        ),
                        title: TextFormField(
                          initialValue: '',
                          onSaved: (val) => board!.subject = val!,
                          validator: (val) => val == "" ? val : null,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.message,
                        ),
                        title: TextFormField(
                          initialValue: '',
                          onSaved: (val) => board!.body = val!,
                          validator: (val) => val == "" ? val : null,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            print("Start");
                            database
                                .reference()
                                .child('Detail')
                                .set({'Firstname': 'Ali'});
                            handleSubmit();
                            print('End');
                            boardMessages;
                          },
                          child: const Text('Post'))
                    ],
                  ),
                ),
              )),
          Flexible(
              child: FirebaseAnimatedList(
            query: databaseReference as Query,
            itemBuilder: (_, DataSnapshot snapshot, Animation<double> animation,
                int index) {
              return Card(
                  child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.red,
                ),
                title: Text(
                  boardMessages[index].subject,
                ),
                subtitle: Text(
                  boardMessages[index].body,
                ),
              ));
            },
          ))
        ],
      ),
    );
  }

  void _onEntryAdded(Event event) {
    setState(() {
      boardMessages.add(Board.formSnapshot(event.snapshot));
    });
  }

  void _onEntryChanged(Event event) {
    var oldEntry = boardMessages.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
  }

  void handleSubmit() {
    final FormState? form = formkey.currentState;
    if (form!.validate()) {
      form.save();
      form.reset();
      databaseReference!.push().set(board!.toJson());
    }
  }
}
