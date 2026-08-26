import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController =
      TextEditingController(); //이메일 컨트롤러
  final TextEditingController _passwordController =
      TextEditingController(); //비밀번호 컨틀로러

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 30),

                Text(
                  'Login here',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F40BA),
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  'Welcome back you’ve\nbeen missed!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 30),

                //이메일 입력창
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue.withValues(alpha: 0.15),
                    hintText: "email",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Color(0xFF1F40BA),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // 비밀번호 입력창
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue.withValues(alpha: 0.15),
                    hintText: "password",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Color(0xFF1F40BA),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                //todo 이 아래부터 다시 시작하면 된다.
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      //누르면 발생할 이벤트 처리
                    },
                    child: Text(
                      'Forgot your password?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F3FB9),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                //로그인 버튼(Sign in)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 60),
                    elevation: 4,
                    shadowColor: Color(0xFF1F3FB9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Color(0xFF1F3FB9),
                  ),
                  onPressed: () {
                    //누르면 발생할 이벤트 처리 : 기능 구현 알림
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Color(0xFF1F3FB9),
                        content: Text(
                          "현재 해당 기능은 준비중입니다.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(height: 30),

                Text(
                  "create new account",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 70),

                Text(
                  'or continue with',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F3FB9),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //다른 서비스로 로그인하는 버튼들
                    _buildOtherServiceLogin(imgPath: "assets/images/google.png"),
                    _buildOtherServiceLogin(imgPath: "assets/images/facebook.png"),
                    _buildOtherServiceLogin(imgPath: "assets/images/apple.png"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOtherServiceLogin({required String imgPath}) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color(0xFF1F3FB9),
            content: Text(
              "현재 해당 기능은 준비중입니다.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        );
      },

      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 6
        ),
        child: Image.asset(imgPath, width: 60, height: 60),
      ),
    );
  }
}
