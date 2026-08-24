import 'package:flutter/material.dart';
import 'login_screen.dart'; //함수를 사용하기 위해서(커스텀 위젯)
import "package:simple_icons/simple_icons.dart";

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //컨트롤러
  final TextEditingController _emailCtrl =
      TextEditingController(); //이메일 or userName 컨트롤러
  final TextEditingController _passwordCtrl =
      TextEditingController(); //비밀번호 컨트롤러
  final TextEditingController _passwordCheckCtrl =
      TextEditingController(); //비밀번호 확인 컨트롤러

  bool _passwordIsShow = false;
  bool _passwordCheckIsShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),

              //1. 상단 제목
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  "Create an\naccount!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              //2. 정보 입력 필드

              //텍스트 필드 입력란
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailCtrl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withValues(alpha: 0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.person, color: Colors.grey),
                    hintText: "Please Enter your email",
                  ),
                ),
              ),

              //비밀번호 입력란
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !_passwordIsShow,
                  controller: _passwordCtrl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withValues(alpha: 0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.grey),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordIsShow = !_passwordIsShow;
                        });
                      },
                      icon: Icon(
                        _passwordIsShow
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                    hintText: "Please Enter your password",
                  ),
                ),
              ),

              //비밀번호 재입력란
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !_passwordCheckIsShow,
                  controller: _passwordCheckCtrl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withValues(alpha: 0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.grey),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordCheckIsShow = !_passwordCheckIsShow;
                        });
                      },
                      icon: Icon(
                        _passwordCheckIsShow
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                    hintText: "Please one more Enter your password",
                  ),
                ),
              ),

              SizedBox(height: 10),

              //아래부분 부가 설명
              RichText(
                text: TextSpan(
                  // 기본 텍스트 스타일 지정
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                  children: [
                    const TextSpan(text: 'By clicking the '),
                    TextSpan(
                      text: 'Register',
                      style: TextStyle(
                        color: const Color(0xFFF43756).withValues(alpha: 0.8),
                      ),
                    ),
                    const TextSpan(
                      text: ' button, you agree\nto the public offer',
                    ),
                  ],
                ),
              ),

              //계정 만들기 버튼
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Color(0xFFF63757),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(6),
                    ),
                  ),
                  onPressed: () {
                    //다음으로 넘어갈 수 있도록 하는 부분, 나중에 유효성 함수 추가하면 좋을 듯
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(
                            "현재 준비중인 기능입니다."
                        ))
                    );
                  },
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "- OR Continue with -",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginScreen.buildLoginCircle(
                    icon: SimpleIcons.google,
                    color: SimpleIconColors.google,
                    onTap: () {
                      // 구글 로그인 로직
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("현재 해당 기능은 준비중입니다.")),
                      );
                    },
                  ),
                  const SizedBox(width: 16),
                  LoginScreen.buildLoginCircle(
                    icon: SimpleIcons.apple,
                    color: Colors.black,
                    onTap: () {
                      // 애플 로그인 로직
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("현재 해당 기능은 준비중입니다.")),
                      );
                    },
                  ),
                  const SizedBox(width: 16),
                  LoginScreen.buildLoginCircle(
                    icon: SimpleIcons.facebook,
                    color: SimpleIconColors.facebook,
                    onTap: () {
                      // 페이스북 로그인 로직
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("현재 해당 기능은 준비중입니다.")),
                      );
                    },
                  ),
                ],
              ),

              SizedBox(height: 20),

              //여기서 다시 로그인으로 넘어가는 부분
              //Color(0xFFF43756)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 3),

                  Text(
                    'I Already Have an Account',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),

                  TextButton(
                      onPressed: () {
                        //이전 화면으로 pop
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login',
                         style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.bold,
                           color: Color(0xFFF43756),
                           decoration: TextDecoration.underline,
                           decorationColor: Color(0xFFF43756)
                         ),
                      )
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
