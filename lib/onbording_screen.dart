import 'package:clone_pr/main_page.dart';
import 'package:flutter/material.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. 전체 배경 이미지
          Positioned.fill(
            child: Image.asset(
              'assets/images/bacground.png', // 오타 주의 (background.png)
              fit: BoxFit.cover,
            ),
          ),

          // 2. 상단 "Aspen" 폰트/타이틀
          const Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Aspen',
                style: TextStyle(
                  fontFamily: 'alexBrush',
                  fontSize: 110,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),

          // 3. 하단 문구 및 버튼
          SafeArea(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Plan your',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 4),

                    const Text(
                      'Luxurious\nVacation',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        height: 1.1, // 줄간격 조절
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(350, 56),
                    backgroundColor: Color(0xFF186DEC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    )
                  ),

                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(),));
                    },
                    child: Text(
                      "Explore",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}