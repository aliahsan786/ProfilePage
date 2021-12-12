import 'package:fast_food_cafe_grill/NavBar.dart';
import 'package:fast_food_cafe_grill/Screens/ItemDetailScreen.dart';
import 'package:flutter/material.dart';

import 'StartScreens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF3F51B5),
      ),
      home: const SplashScreen(),
    );
  }
}
