import 'package:clone_pr/login/login_screen.dart';
import 'package:clone_pr/splash_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // 컨트롤러
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _mobileCtrl = TextEditingController();
  final TextEditingController _birthCtrl = TextEditingController();

  // 비밀번호 상태 관리 변수 (false: 숨김, true: 보임)
  bool _isPasswordShow = false;

  // 자원 해제
  @override
  void dispose() {
    _nameCtrl.dispose();
    _passwordCtrl.dispose();
    _emailCtrl.dispose();
    _mobileCtrl.dispose();
    _birthCtrl.dispose();
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

  // 텍스트 필드 공통 스타일 (반복 줄이기용)
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF1E7B4),
              hintText: label == 'Mobile Number'
                  ? '+123 456 789'
                  : label == 'Date of birth'
                  ? 'DD / MM / YYY'
                  : 'example@example.com',
              hintStyle: TextStyle(color: Colors.black45),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              suffixIcon: suffixIcon,
            ),
          ),
        ],
      ),
    );
  }

  // 소셜 회원가입 아이콘 (원형 배경)
  Widget _buildSocialCircleIcon({
    required Widget icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 22,
        backgroundColor: SplashScreen.orange.withValues(alpha: 0.15),
        child: icon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SplashScreen.yellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 50),

          // 1. 뒤로가기 아이콘 + New Account 타이틀
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 20,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black87,
                    size: 15,
                  ),
                ),
              ),
              const SizedBox(width: 30),
              const Text(
                'New Account',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // 2. 메인 콘텐츠를 담은 흰색 컨테이너
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Full name
                    _buildTextField(label: 'Full name', controller: _nameCtrl),

                    // Password
                    _buildTextField(
                      label: 'Password',
                      controller: _passwordCtrl,
                      obscureText: !_isPasswordShow,
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordShow = !_isPasswordShow;
                          });
                        },
                        icon: Icon(
                          _isPasswordShow
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: SplashScreen.orange,
                        ),
                      ),
                    ),

                    // Email
                    _buildTextField(
                      label: 'Email',
                      controller: _emailCtrl,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    // Mobile Number
                    _buildTextField(
                      label: 'Mobile Number',
                      controller: _mobileCtrl,
                      keyboardType: TextInputType.phone,
                    ),

                    // Date of birth
                    _buildTextField(
                      label: 'Date of birth',
                      controller: _birthCtrl,
                      keyboardType: TextInputType.datetime,
                    ),

                    const SizedBox(height: 16),

                    // 약관 동의 문구
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: 'By continuing, you agree to ',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                          children: [
                            TextSpan(
                              text: '\nTerms of Use',
                              style: TextStyle(
                                color: SplashScreen.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy.',
                              style: TextStyle(
                                color: SplashScreen.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Sign Up 버튼
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: SplashScreen.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            _showMessage();
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // or sign up with
                    Center(
                      child: Text(
                        'or sign up with',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // 소셜 회원가입 아이콘들
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialCircleIcon(
                          icon: Image.asset(
                            'assets/sign_up_with/google.png',
                            width: 22,
                            height: 22,
                          ),
                          onTap: _showMessage,
                        ),
                        const SizedBox(width: 16),
                        _buildSocialCircleIcon(
                          icon: Image.asset(
                            'assets/sign_up_with/Facebook_Logo.png',
                            width: 22,
                            height: 22,
                          ),
                          onTap: _showMessage,
                        ),
                        const SizedBox(width: 16),
                        _buildSocialCircleIcon(
                          icon: Icon(
                            Icons.fingerprint,
                            color: SplashScreen.orange,
                            size: 24,
                          ),
                          onTap: _showMessage,
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Already have an account? Log in
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account? ',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Log in',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: SplashScreen.orange,
                              decoration: TextDecoration.underline,
                              decorationColor: SplashScreen.orange,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
