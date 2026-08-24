import 'package:flutter/material.dart';

class IntroduceScreen extends StatelessWidget {
  const IntroduceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 사진과 설명 부분
        Image.asset(
            'assets/images/fashion_shop1.png'
        ),

        //설명 제목 부분
        Text(
          'Choose Products',
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),

        Text(
          'Amet minim mollit non deserunt ullamco est\n'
              'sit aliqua dolor do amet sint. Velit officia\n'
              'consequat duis enim velit mollit.',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey.withValues(alpha: 0.8)
          ),
        ),
      ],
    );
  }
}