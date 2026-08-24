import 'package:clone_pr2/login/forgot_password_screen.dart';
import 'package:clone_pr2/login/sign_in_screen.dart';
import 'package:clone_pr2/main_screens/shop_splash_screen.dart';
import 'package:flutter/material.dart';
import "package:simple_icons/simple_icons.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  //다른 서비스로 로그인 함수
  static Widget buildLoginCircle({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
          ),
          child: Center(child: Icon(icon, size: 24, color: color)),
        ),
      ),
    );
  }
}

//기능 준비중 알림 함수

class _LoginScreenState extends State<LoginScreen> {
  //임시 비밀번호 : 추후 변경 예정
  String email = "seohyen";
  String password = "090213";

  //텍스트 필드 컨트롤러들
  final TextEditingController _emailCtrl = TextEditingController(); //이메일 컨트롤러
  final TextEditingController _passwordCtrl = TextEditingController(); //비밀번호 컨트롤러

  //비밀번호 공개 여부 상태 저장 함수
  bool passwordIsShow = false;

  void _showComingSoon() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("현재 해당 기능은 준비 중입니다.")));
  }

  void tryLogin() {
    final currentEmail = _emailCtrl.text.trim();
    final currentPassword = _passwordCtrl.text.trim();

    if (currentEmail == email && currentPassword == password) {
      //이 부분에서 나중에 메인 화면이로 이동하기 버튼 추가하기
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  "Welcome\nBack!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              //이메일 입력란
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
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !passwordIsShow,
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
                          passwordIsShow = !passwordIsShow;
                        });
                      },
                      icon: Icon(
                        passwordIsShow
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                    hintText: "Please Enter your password",
                  ),
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(top: 16),
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
                    //다음으로 넘어갈 수 있도록 하는 부분, 나중에 유효성 함수 추가하면 좋을 듯
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(
                            "로그인 성공"
                        ))
                    );
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ShopSplashScreen()));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              // 여기에 패스워드 기억 안나면 화면 넘어가도록 하는 부분
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    //비밀번호 찾기 화면으로 이동
                     Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),

              //다른 서비스로 로그인 부분 구분선
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

              //다른 서비스로 로그인 하는 부분
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginScreen.buildLoginCircle(
                    icon: SimpleIcons.google,
                    color: SimpleIconColors.google,
                    onTap: () {
                      // 구글 로그인 로직
                      _showComingSoon();
                    },
                  ),
                  const SizedBox(width: 16),
                  LoginScreen.buildLoginCircle(
                    icon: SimpleIcons.apple,
                    color: Colors.black,
                    onTap: () {
                      // 애플 로그인 로직
                      _showComingSoon();
                    },
                  ),
                  const SizedBox(width: 16),
                  LoginScreen.buildLoginCircle(
                    icon: SimpleIcons.facebook,
                    color: SimpleIconColors.facebook,
                    onTap: () {
                      // 페이스북 로그인 로직
                      _showComingSoon();
                    },
                  ),
                ],
              ),

              //가입 텍스트 버튼
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create An Account",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        //누르면 가입 화면으로 넘어갈 수 있도록 하는 부분
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF43756),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFF43756),
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
    );
  }
}
