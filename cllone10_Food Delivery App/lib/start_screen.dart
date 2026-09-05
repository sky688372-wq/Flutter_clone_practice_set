import 'package:clone_pr/login/login_screen.dart';
import 'package:clone_pr/login/register_screen.dart';
import 'package:clone_pr/splash_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SplashScreen.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1,앱 로고
            Image.asset('assets/images/welcom.png'),

            SizedBox(height: 20),

            // 2. 앱로고 아래 간단한 텍스트
            Text(
              'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 30),

            //3.로그인과 가입 버튼

            //로그인 버튼
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: SplashScreen.yellow,
                minimumSize: Size(220, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                //로그인 화면으로 이동 로직
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text(
                "Log in",
                style: TextStyle(
                  color: SplashScreen.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 10),

            //회원 가입 버튼
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFE3D9A9),
                minimumSize: Size(220, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: SplashScreen.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
