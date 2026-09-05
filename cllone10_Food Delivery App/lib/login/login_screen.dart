import 'package:clone_pr/login/home/main_manage_screen.dart';
import 'package:clone_pr/login/register_screen.dart';
import 'package:clone_pr/splash_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 컨트롤러
  final TextEditingController _emailCtrl = TextEditingController(); // 이메일 컨트롤러
  final TextEditingController _passwordCtrl =
      TextEditingController(); // 비밀번호 컨트롤러

  // 비밀번호 상태 관리 변수 (false: 숨김, true: 보임)
  bool _isPasswordShow = false;

  // 자원 해제
  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  void _showMessage() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.blue,
        content: Text(
          "현재 개발 중인 기능입니다.",
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
      backgroundColor: SplashScreen.yellow,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),

            // 1. 이전으로 가기 아이콘 버튼과 로그인 텍스트
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // 뒤로가기 버튼
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 20,
                  ),
                  child: IconButton(
                    onPressed: () {
                      // 이전으로 돌아가기 버튼
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black87,
                      size: 15,
                    ),
                  ),
                ),

                SizedBox(width: 100),

                // 로그인 텍스트 버튼
                Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            SizedBox(height: 40),

            // 2. 메인 콘텐츠들을 담은 컨테이너
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 30,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // 웰컴 문구
                        Align(
                          alignment: Alignment.topLeft,

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),

                              SizedBox(height: 5),

                              // 웰컴 문구 아래 ~ 텍스트
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore\nmagna aliqua.',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 20),

                        // 이메일 텍스트 필드
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailCtrl,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFF1E7B4),
                              label: Text(
                                'Email or Mobile Number',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),

                        // 비밀번호 텍스트 필드
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: TextField(
                            obscureText: !_isPasswordShow,
                            keyboardType: TextInputType.visiblePassword,
                            controller: _passwordCtrl,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFF1E7B4),
                              label: Text(
                                'Password ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  // 상태 토글 전환 로직
                                  setState(() {
                                    _isPasswordShow = !_isPasswordShow;
                                  });
                                },
                                icon: Icon(
                                  _isPasswordShow
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                          ),
                        ),

                        //비밀번호 찾기 텍스트 버튼
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              //누르면 비밀번호 찾기 화면으로 넘어갈 로직
                            },
                            child: Text(
                              'Forget password',
                              style: TextStyle(
                                color: SplashScreen.orange,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 30),

                        //로그인 버튼
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: SplashScreen.orange,
                            minimumSize: Size(220, 55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainManageScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Log in",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        SizedBox(height: 40),

                        //다른 서비스로 로그인 버튼들
                        Text(
                          "or sign up with",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                          ),
                        ),

                        //구글 로그인 버튼
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    _showMessage();
                                  },

                                  child: Image.asset(
                                    'assets/sign_up_with/google.png',
                                    fit: BoxFit.cover,
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),

                              SizedBox(width: 8),

                              //페이스북 로그인 버튼
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          _showMessage();
                                        },

                                        child: Image.asset(
                                          'assets/sign_up_with/Facebook_Logo.png',
                                          fit: BoxFit.cover,
                                          width: 30,
                                          height: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(width: 4),

                              //지문으로 로그인
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          _showMessage();
                                        },

                                        child: Icon(
                                          Icons.fingerprint,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 10),

                        // 계정이 없으신가요? 문구
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don’t have an account?',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: SplashScreen.orange,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: SplashScreen.orange,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
