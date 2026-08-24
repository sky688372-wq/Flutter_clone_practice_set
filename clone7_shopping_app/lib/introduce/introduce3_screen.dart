import 'package:flutter/material.dart';

class Introduce3Screen extends StatelessWidget {
  const Introduce3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 사진과 설명 부분
            Image.asset(
                'assets/images/shopping_bag1.png'
            ),

            //설명 제목 부분
            Text(
              'Get Your Order',
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
        ),
      ),
    );
  }
}
