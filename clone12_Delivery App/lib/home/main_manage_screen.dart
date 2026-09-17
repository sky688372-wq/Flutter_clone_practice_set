import 'package:clone_pr/home/category_screen.dart';
import 'package:clone_pr/home/product_screen.dart';
import 'package:flutter/material.dart';

class MainManageScreen extends StatefulWidget {
  const MainManageScreen({super.key});

  @override
  State<MainManageScreen> createState() => _MainManageScreenState();
}

class _MainManageScreenState extends State<MainManageScreen> {
  int _currentIndex = 0; //현재 인덱스 페이지

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [CategoryScreen(), ProductScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.purpleAccent,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.grid_view_outlined),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          BottomNavigationBarItem(label: '', icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
