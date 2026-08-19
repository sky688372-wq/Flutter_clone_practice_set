import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  //입력 컨트롤러
  TextEditingController _emailCtrl = TextEditingController(); //이메일 입력 컨트롤러
  TextEditingController _passwordCtrl = TextEditingController(); //비밀번호 입력 컨트롤러

  //비밀번호 표시 상태 변수
  bool _passwordIsShow = false;
  //체크 박스 표시 확인 변수
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //겹침용 박스 컨테이너
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                color: Colors.blueAccent,
              ),
            ],
          ),

          //메인 콘텐츠
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 50),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Symbols.flutter, color: Colors.white, size: 50),
                ),

                Text(
                  "Sign in to your\nAccount",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "Enter your email and password to log in",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),

                SizedBox(height: 50),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //구글 로그인 버튼
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(10),
                              ),
                              minimumSize: Size(double.infinity, 50),
                              backgroundColor: Colors.white
                            ),
                            onPressed: () {
                              //누르면 반응하도록
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Symbols.flutter,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 7,),

                                Text(
                                  'Continue with Flutter',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),
                                )
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Divider(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),

                                Text(
                                  'or',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey
                                  ),
                                ),

                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Divider(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //이메일 입력 필드
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailCtrl,
                              decoration: InputDecoration(
                                hintText: "Enter your email address",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.withValues(alpha: 0.1),
                                  )
                                )
                              ),
                            ),
                          ),

                          //비밀번호 입력 필드
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: TextField(
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _passwordIsShow? false : true,
                              obscuringCharacter: '*',
                              controller: _passwordCtrl,
                              decoration: InputDecoration(
                                  hintText: "Enter your password",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.grey.withValues(alpha: 0.1),
                                      )
                                  ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      //트리거 변수 상태를 반대로 만들기
                                      setState(() {
                                        _passwordIsShow = !_passwordIsShow;
                                      });
                                    },
                                    icon: Icon(
                                      _passwordIsShow? Icons.remove_red_eye_sharp : Icons.visibility_off
                                    )
                                )
                              ),
                            ),
                          ),

                          //체크 박스 Row라인
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: isChecked,
                                      onChanged: (value) {
                                        //체크 박스 상태 변수를 돌려준다.
                                        setState(() {
                                          isChecked = !isChecked;
                                        });
                                      },
                                  ),
                                  Text(
                                    'Remember me',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey
                                    ),
                                  )
                                ],
                              ),

                              TextButton(
                                  onPressed: () {
                                    //누르면 이벤트 처리 할곳
                                    ScaffoldMessenger.of(context).clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(
                                            "현재 해당 기능은 진행중입니다."
                                        ))
                                    );
                                  },
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue
                                    ),
                                  )
                              )
                            ],
                          ),

                          //로그인 버튼
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 50),
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(10)
                                  ),

                                ),
                                onPressed: () {
                                  //누르면 로그인 처리 할 부분
                                  ScaffoldMessenger.of(context).clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(
                                      "현재 해당 기능은 진행중입니다."
                                    ))
                                  );
                                },
                                child: Text(
                                  "Log in",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white
                                  ),
                                )
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey
                                ),
                              ),

                              TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(
                                            "현재 해당 기능은 진행중입니다."
                                        ))
                                    );
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  )
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
