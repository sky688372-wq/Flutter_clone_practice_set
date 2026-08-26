import 'package:clone_pr/login_screen.dart';
import 'package:clone_pr/sign_in_screen.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/images/welcome image.png'),

                SizedBox(height: 10),

                Text(
                  'Discover Your\nDream Job here',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F40BA),
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  'Explore all the existing job roles based on your\ninterest and study major',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),

                SizedBox(height: 100),

                //하단 아래의 버튼 두개(로그인 및 가입)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //로그인 버튼 파랑
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Color(0xFF1F40BA),
                          minimumSize: Size(130, 45),
                          backgroundColor: Color(0xFF1F40BA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          //누르면 로그인 화면으로 이동
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      //회원 가입 버튼
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(130, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          //누르면 화면 넘어가는 로직
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
