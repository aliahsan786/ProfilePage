import 'package:cloud_firestore/cloud_firestore.dart';

class DataStoreModels {
  void insertData(String title, String pasword) async {
    Map<String, dynamic> ourData = {'title': "$title", 'Password': '$pasword'};

    final db = FirebaseFirestore.instance.collection('Dairy');
    db.doc().set(ourData).then((value) => print('Success'));
  }
}
