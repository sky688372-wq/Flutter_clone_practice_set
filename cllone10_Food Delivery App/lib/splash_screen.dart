import 'package:clone_pr/start_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  //공용으로 사용할 생각
  static Color orange = Color(0xFFE75222); //진한 주황색
  static Color yellow = Color(0xFFF3C957); //약간 살색같은 노랑색

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //다음으로 넘어가는 화면 로직
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToNext();
  }

  // 화면 전환을 담당하는 비동기 함수
  Future<void> _navigateToNext() async {
    // 2초 대기
    await Future.delayed(const Duration(seconds: 2));

    // 위젯이 화면에 아직 존재하는지 확인 후 화면 전환
    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const StartScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SplashScreen.yellow,
      body: Center(
        child: Align(
          alignment: Alignment.center,
          child: Image.asset('assets/images/app_logo.png'),
        ),
      ),
    );
  }
}
