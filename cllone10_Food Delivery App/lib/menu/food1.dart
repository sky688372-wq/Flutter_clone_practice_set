import 'package:flutter/material.dart';
import 'package:clone_pr/splash_screen.dart';

class Food1 extends StatelessWidget {
  const Food1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // 왼쪽 주황색 텍스트 영역
          Expanded(
            flex: 4,
            child: Container(
              color: SplashScreen.orange,
              child: Stack(
                children: [
                  // 상단 노란색 링 장식
                  Positioned(
                    top: -25,
                    right: 10,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: SplashScreen.yellow,
                          width: 8,
                        ),
                      ),
                    ),
                  ),
                  // 하단 좌측 노란색 링 장식
                  Positioned(
                    bottom: -20,
                    left: -20,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: SplashScreen.yellow,
                          width: 8,
                        ),
                      ),
                    ),
                  ),
                  // 텍스트 내용
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Experience our\ndelicious new dish",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "30% OFF",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 오른쪽 피자 이미지 영역
          Expanded(
            flex: 4,
            child: Image.asset(
              'assets/images/food1.png',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
