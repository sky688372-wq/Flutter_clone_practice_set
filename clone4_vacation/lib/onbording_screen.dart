import 'package:clone_pr/mainPage_screen.dart';
import 'package:flutter/material.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {

  bool _isAnim = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _isAnim = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),

          //상단 GT. 텍스트
          Positioned(
            top: 40,
            left: 30,
            child: Text(
              "GT.",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          ),

          Positioned(
            top: 160,
            left: 60,
            right: 60,
            child: AnimatedSlide(
              duration: const Duration(milliseconds: 300),
              offset: _isAnim ? Offset.zero : const Offset(0, 0.5),
              child: const Text(
                'Vacation',
                style: TextStyle(
                    fontFamily: "DancingScript",
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
            ),
          ),

          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 45),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)
                        )
                    ),
                    onPressed: () {
                      //다음으로 넘어갈 화면
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MainpageScreen(),));
                    },
                    child: Text(
                      'Start',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}