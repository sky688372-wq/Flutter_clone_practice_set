import 'package:clone_pr/function/app_functions.dart';
import 'package:clone_pr/home/main_manage_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 0. 배경 화면
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),

          // 1. 상단 D 로고
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color(0xFFCBFDB5),
                  child: Image.asset(
                    'assets/images/d_logo.png',
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ),
          ),

          // 2. 메인 콘텐츠 컨테이너
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // 컨테이너 상단 circleAvator
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey.withValues(alpha: 0.2),
                        child: Image.asset('assets/images/Box.png'),
                      ),

                      const SizedBox(height: 20),

                      //3. Non-Contact Deliveries
                      const Text(
                        'Non-Contact\nDeliveries',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 30),

                      Text(
                        'When placing an order, select the option\n“Contactless delivery” and the courier will leave your order at the door.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 50),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen.withValues(
                            alpha: 0.85,
                          ),
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
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
                        child: const Text(
                          'ORDER NOW',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      TextButton(
                        onPressed: () {
                          AppFunctions.showBuilding(context);
                        },
                        child: const Text(
                          'DISMISS',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
