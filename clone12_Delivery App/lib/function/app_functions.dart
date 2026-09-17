import 'package:flutter/material.dart';

class AppFunctions {
  // 매개변수로 context를 넘겨받도록 하여서 static사용
  static void showBuilding(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.lightGreen,
        behavior: SnackBarBehavior.floating,
        content: Text(
          '현재 해당 기능은 개발중입니다.',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}