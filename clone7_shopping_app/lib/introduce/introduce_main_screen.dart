import 'package:clone_pr2/introduce/introduce3_screen.dart';
import 'package:clone_pr2/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'introduce1_screen.dart';
import 'introduce2_screen.dart';

class IntroduceMainScreen extends StatefulWidget {
  const IntroduceMainScreen({super.key});

  @override
  State<IntroduceMainScreen> createState() => _IntroduceMainScreenState();
}

class _IntroduceMainScreenState extends State<IntroduceMainScreen> {
  static const int totalPages = 3;

  int currentIndex = 0; // 0이 베이스
  late final PageController _pageController =
  PageController(initialPage: currentIndex);

  void _goToNext() {
    if (currentIndex < totalPages - 1) {
      _pageController.animateToPage(
        currentIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  void _skip() {
    // 누르면 나중에 메인 화면으로 이동하도록 하는 부분
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // 1. 상단 앱바 부분 (공통, 고정)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        (currentIndex + 1).toString(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                      Text(
                        '/3',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: _skip,
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),
                      )
                  )
                ],
              ),
            ),

            SizedBox(height: 50,),

            // 2. 고정된 콘텐츠 영역 (여기 안에서만 페이지별 내용이 바뀜)
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                children: const [
                  IntroduceScreen(),
                  Introduce2Screen(),
                  Introduce3Screen()
                ],
              ),
            ),

            // 3. 하단 인디케이터 (공통, 고정임)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: totalPages,
                effect: const ExpandingDotsEffect(
                  dotHeight: 9,
                  dotWidth: 9,
                  activeDotColor: Color(0xFF1A1F3C),
                  dotColor: Color(0xFFD9D9D9),
                  expansionFactor: 3,
                  spacing: 6,
                ),
                onDotClicked: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),

            // 4. 하단 Next 버튼 (공통, 고정)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Colors.redAccent.withValues(alpha: 0.7)
                  ),
                  onPressed: _goToNext,
                  child: Text(
                    "Next",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  )
              ),
            ),

            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}