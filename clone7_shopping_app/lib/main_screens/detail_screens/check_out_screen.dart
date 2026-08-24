import 'package:flutter/material.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  //컨트롤러들
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _pinCodeCtrl =
      TextEditingController(); // 핀 코드 컨트롤러
  final TextEditingController _addressCtrl = TextEditingController(); // 주소 컨트롤러
  final TextEditingController _cityCtrl = TextEditingController(); // 도시 컨트롤러
  final TextEditingController _stateCtrl =
      TextEditingController(); // state가 뭔지 모르는데 일단 state컨크롤러
  final TextEditingController _accountHolderName =
      TextEditingController(); // 어카운트 홀더 네임 컨트롤러
  final TextEditingController _IFSCCodeCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //1. 앱바 부분
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Check out",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),

      //2. 바텀 네비게이터 바 부분
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              // 2. 구매하기 버튼 (Buy)
              Expanded(
                child: SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF43756),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOutScreen()));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.flash_on, color: Colors.white, size: 20),
                        SizedBox(width: 6),
                        Text(
                          'Buy',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    fit: BoxFit.cover,
                    width: 70,
                    height: 70,
                  ),
                ),
              ),

              SizedBox(height: 10),

              Text(
                'Personal Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              _buildTextFiled(
                name: "email",
                hintText: "Enter Your email address",
                controller: _emailCtrl,
                icon: Icons.email_outlined,
              ),

              _buildTextFiled(
                name: "password",
                hintText: "Enter Your password",
                controller: _passwordCtrl,
                icon: Icons.lock_outline_rounded,
              ),

              //비밀번호 변경 버튼
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    //해당 기능은 준비중이라는 안내 메세지
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.pinkAccent,
                      decorationThickness: 1.5,
                    ),
                  ),
                ),
              ),

              Divider(),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Business Address Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),

              _buildTextFiled(
                name: "Pincode",
                hintText: "Enter tour pincode",
                controller: _pinCodeCtrl,
                icon: Icons.pin_outlined,
              ),

              _buildTextFiled(
                name: "Address",
                hintText: "Enter your address",
                controller: _addressCtrl,
                icon: Icons.location_on_sharp,
              ),

              _buildTextFiled(
                name: "city",
                hintText: "Enter your city",
                controller: _cityCtrl,
                icon: Icons.location_city,
              ),

              _buildTextFiled(
                name: "state",
                hintText: "Enter your state",
                controller: _stateCtrl,
                icon: Icons.real_estate_agent,
              ),
              _buildTextFiled(
                name: "Account Holder’s Name",
                hintText: "Enter your name",
                controller: _accountHolderName,
                icon: Icons.person,
              ),

              _buildTextFiled(
                name: "IFSC Code",
                hintText: "Enter your IFSC Code",
                controller: _IFSCCodeCtrl,
                icon: Icons.code,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFiled({
    required String name,
    required String hintText,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(name, style: TextStyle(fontSize: 16, color: Colors.grey)),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: TextField(
            controller: _emailCtrl,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: 'Enter your email address',
              prefixIcon: Icon(icon),
            ),
          ),
        ),
      ],
    );
  }
}
