import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';

// ignore: use_key_in_widget_constructors
class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop App"),
      ),
      body: ProductsGrid(),
    );
  }
}
