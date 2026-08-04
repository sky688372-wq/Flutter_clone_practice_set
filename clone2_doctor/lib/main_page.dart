import 'dart:ui';
import 'package:clone_pr/calender_screen.dart';
import 'package:clone_pr/detail_screen.dart';
import 'package:clone_pr/doctor_info.dart';
import 'package:clone_pr/serch_doctor.dart';
import 'package:easy_animated_indexed_stack/easy_animated_indexed_stack.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 현재 선택된 네비게이션 바 인덱스 상태 변수
  int _currentIndex = 0;

  // 의사 리스트
  List<DoctorInfo> doctorList = [
    DoctorInfo(
        name: "Dr. Maria Waston",
        introduce: "Heart Surgeon, London, England",
        ProfilePath: 'assets/images/doctorList/doctor1.png',
        rating: 4.8
    ),
    DoctorInfo(
        name: "Dr. Alexander Smith",
        introduce: "Neurologist, New York, USA",
        ProfilePath: 'assets/images/doctorList/doctor2.jpeg',
        rating: 4.9
    ),
    DoctorInfo(
        name: "Dr. Olivia Johnson",
        introduce: "Pediatrician, Toronto, Canada",
        ProfilePath: 'assets/images/doctorList/doctor3.jpeg',
        rating: 4.7
    ),
    DoctorInfo(
        name: "Dr. William Brown",
        introduce: "Dermatologist, Sydney, Australia",
        ProfilePath: 'assets/images/doctorList/doctor4.jpeg',
        rating: 4.6
    ),
    DoctorInfo(
        name: "Dr. Zephirin Kamuanga",
        introduce: "Hello, I am Dr. [Name], a physician from Congo dedicated to your health.",
        ProfilePath: 'assets/images/doctorList/doctor5.jpeg',
        rating: 4.6
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: EasyAnimatedIndexedStack(
        index: _currentIndex,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [Color(0xFFB18BFD), Color(0xFFBDA1E7)],
                    ),
                  ),
                  child: Stack(
                    children: [
                      // 1. 메뉴 버튼
                      Positioned(
                        top: 45,
                        left: 10,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.menu, color: Colors.white),
                        ),
                      ),

                      // 2. 환영 텍스트
                      Positioned(
                        top: 110,
                        left: 25,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Let's find\nyour top doctor!",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // 3. 검색창
                      Positioned(
                        top: 250,
                        left: 25,
                        right: 25,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search_rounded, color: Colors.grey),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Search health issue......",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 20,
                    ),
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCategory(
                        'All', Icons.all_inclusive_outlined, Colors.green),
                    _buildCategory(
                        'Cardiology', Icons.monitor_heart, Colors.pinkAccent),
                    _buildCategory('Medicine', Icons.medication, Colors.blue),
                    _buildCategory(
                        'General', Icons.healing, Colors.pink.withOpacity(0.7)),
                  ],
                ),


                ListView.builder(
                  itemCount: doctorList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final doctor = doctorList[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.purple.withOpacity(0.1),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      doctor.ProfilePath,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 2,
                                  right: 2,
                                  child: Container(
                                    width: 14,
                                    height: 14,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF4CD964),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 2),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(width: 15),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    doctor.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF2D3142),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    doctor.introduce,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.star_rounded,
                                              color: Color(0xFF4CD964), size: 20),
                                          SizedBox(width: 4),
                                          Text(
                                            doctor.rating.toString(),
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF2D3142),
                                            ),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(
                                            builder: (context) =>
                                                DetailScreen(name: doctor.name,
                                                    imagePath: doctor
                                                        .ProfilePath),));
                                        },

                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF4F5F7),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            'Appointment',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF2D3142),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 100),
              ],
            ),
          ),

          // ---- 나머지 탭 화면 (임시 화면, 추후 실제 위젯으로 교체) ----
          const CalenderScreen(),
          const Center(child: Text('Chat 화면')),
          SerchDoctor(doctorList: doctorList,),
          const Center(child: Text('My 화면')),
        ],
      ),

      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.white.withOpacity(0.6),
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.purple,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.transparent,
                elevation: 0,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_month),
                    label: 'Calendar',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat),
                    label: 'Chat',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add_circle),
                    label: 'find doctor',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'My',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(String title, IconData icon, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey.shade300,
                  style: BorderStyle.solid,
                  width: 1.2,
                ),
              ),
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
          ),
          SizedBox(height: 6),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}