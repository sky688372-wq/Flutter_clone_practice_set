import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //컨트롤러
  final TextEditingController _ctrl = TextEditingController();

  void _showComingSoon() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        content: Text(
          '현재 개발 중인 기능입니다.',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //1. 상단 야채 이미지
            Image.asset(
              'assets/images/vegetable.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 400,
            ),

            SizedBox(height: 20),

            // 메인 요소들
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // 2. 이미지 아래 텍스트
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Get your groceries\nwith nectar',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  //3. 텍스트 필드
                  TextField(
                    keyboardType: TextInputType.phone,
                    controller: _ctrl,
                    decoration: InputDecoration(prefixIcon: Icon(Icons.public)),
                  ),

                  SizedBox(height: 40),

                  //4. 다른 서비스로 로그인 하기 전 텍스트
                  Text(
                    'Or connect with social media',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      color: Colors.grey
                    ),
                  ),

                  SizedBox(height: 30),

                  //5. 로그인 버튼들 -> 그냥 커스첨 위젯 처리하며 편할 듯

                  //구글 로그인 버튼
                  _buildLoginButton(
                    serviceImgPath: "assets/images/google_logo.png",
                    serviceName: "Google",
                    backgroundColor: Colors.white,
                  ),

                  //페이스북 로그인 버튼
                  _buildLoginButton(
                    serviceImgPath: "assets/images/Facebook_Logo.png",
                    serviceName: "Facebook",
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton({
    required String serviceImgPath,
    required serviceName,
    required Color backgroundColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: ElevatedButton.icon(
        onPressed: () {
          _showComingSoon();
        },
        icon: Image.asset(serviceImgPath, width: 20, height: 20),
        label: Text(
          'Continue with $serviceName',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, //버튼 배경색
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.black87.withValues(alpha: 0.1)),
          ),
        ),
      ),
    );
  }
}
