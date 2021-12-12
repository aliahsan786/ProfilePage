// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen(
    this.id,
    this.title,
  );
  final String id;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Center(
        child: Image.asset('image'),
      ),
    );
  }
}
