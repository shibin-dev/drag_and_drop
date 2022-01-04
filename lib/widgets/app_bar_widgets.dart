import 'package:flutter/material.dart';

Widget buildAppBar() {
  final double height = 52;

  return AppBar(
    title: Text("Dragg"),
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Container(
        alignment: Alignment.center,
        height: height,
        child: _buildScore(12),
      ),
    ),
  );
}

Widget _buildScore(int score) {
  final style = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Score ',
        style: style,
      ),
      Container(
        width: 60,
        child: Text(
          '$score',
          style: style,
          textAlign: TextAlign.right,
        ),
      ),
    ],
  );
}
