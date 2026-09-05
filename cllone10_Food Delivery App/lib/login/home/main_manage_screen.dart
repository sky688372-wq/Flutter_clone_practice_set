import 'package:clone_pr/login/home/home_screen.dart';
import 'package:clone_pr/splash_screen.dart';
import 'package:flutter/material.dart';

class MainManageScreen extends StatefulWidget {
  const MainManageScreen({super.key});

  @override
  State<MainManageScreen> createState() => _MainManageScreenState();
}

class _MainManageScreenState extends State<MainManageScreen> {
  //현재 인덱스 번호
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SplashScreen.yellow,
      body: IndexedStack(index: _currentIndex, children: [HomeScreen()]),

      //바텀 네비게이션 바
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        // 아이템 5개 이상일 때 필수임
        backgroundColor: const Color(0xFFE8632C),
        // 오렌지 배경
        selectedItemColor: Colors.white,
        // 선택된 아이템 색
        unselectedItemColor: Colors.white54,
        // 선택 안 된 아이템 색
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: "Food"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_rounded),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: "List",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
            label: "Support",
          ),
        ],
      ),
    );
  }
}
