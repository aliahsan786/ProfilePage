import 'dart:math';

import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  final int number;
  final int total;

  const Player(this.number, this.total);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'images/dice$number.png',
        ),
      ],
    );
  }
}

class Playerbody extends StatelessWidget {
  final int number;
  final int total;

  const Playerbody(this.number, this.total);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          ' Total : $total',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Text(
          'Score : $number',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
