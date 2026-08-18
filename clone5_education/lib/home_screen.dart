import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

//사진 출처 : <a href="https://unsplash.com/ko/%EC%82%AC%EC%A7%84/%EC%82%B0-%EC%95%9E%EC%97%90-%EC%84%9C-%EC%9E%88%EB%8A%94-%EC%95%88%EA%B2%BD%EC%9D%84-%EC%93%B4-%EC%B2%AD%EB%85%84-MSepzbKFz10?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>의 <a href="https://unsplash.com/ko/@__diegohh?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Diego Hernández</a>

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  //현재 인덱스 변수
  int _currentIndex = 0;
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // 터치 시 이벤트
          },
          icon: const Icon(Icons.notes),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // 누를 시 이벤트 처리
            },
            icon: const Icon(
              Icons.notifications,
              size: 25,
            ),
          ),
          Container(
            width: 40,
            height: 40,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            // 출처 : Unsplash
            child: Image.asset(
              'assets/images/profile.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16), // 오른쪽 끝 여백 추가
        ],
      ),

      // 메인 콘텐츠 시작
      body: IndexedStack(
        index: _currentIndex,
        
        children: [
          //인덱스 1
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // 상단 인삿말과 시험 관련 내용 텍스트
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hi, Robin',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                "You have ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "4 pending test ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                "this week",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            
                    const SizedBox(height: 20),
            
                    // 포인터 및 시험 안내 배너 컨테이너
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF2B6BE8), // 파란색
                            Color(0xFF635BFF), // 보라색
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 24,
                          horizontal: 20,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // 1. 왼쪽 텍스트 영역
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // 300 Points
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: const [
                                      Text(
                                        '300',
                                        style: TextStyle(
                                          fontSize: 44,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          height: 1.0,
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        'Points',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  // 설명 글귀
                                  const Text(
                                    'Cross 500 within the week to get a free One on One Class.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                    ),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
            
                            const SizedBox(width: 12),
            
                            // 2. 오른쪽 버튼
                            ElevatedButton(
                              onPressed: () {
                                // 버튼 클릭 이벤트
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF3B52CA),
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Text(
                                'Take test now',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            
                    SizedBox(height: 20,),
            
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '4 Pending tests',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),
                          ),
            
                          SizedBox(width: 7,),
            
                          Icon(
                            Icons.error_outline
                          )
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 10,),
                    
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildCard(
                              "Physics",
                              const Color(0xFFF3E8FF),
                              const Color(0xFFA855F7),
                            ),
            
                            _buildCard(
                              "Chemistry",
                              const Color(0xFFFFF3E0),
                              const Color(0xFFFF7043),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildCard(
                              "Maths",
                              const Color(0xFFE8EAF6), // 연파랑/연연보라 뱃지 배경
                              const Color(0xFF5C6BC0), // 파랑/남색 텍스트/아이콘
                            ),
            
                            _buildCard(
                              "Physics",
                              const Color(0xFFF3E8FF),
                              const Color(0xFFA855F7),
                            ),
                          ],
                        )
                      ],
                    ),
            
                    SizedBox(height: 10,),
            
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Subject',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                    ),
          
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             _buildSubjectCard(Colors.blue, Colors.deepPurpleAccent, "Mathematics"),
                             _buildSubjectCard(Colors.red, Colors.orange, "Chemistry"),
                          ],
                        ),
          
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildSubjectCard(Colors.purple ,Colors.pinkAccent, "Physics"),
                            _buildSubjectCard(Color(0xFFD19545), Colors.grey, "Reasoning"),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          //임시 화면
          Center(
            child: Text(
              "임시 화면, 서브젝트",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Center(
            child: Text(
              "임시 화면, FAQ's",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
      
      //여기가 바텀 네비게이션 바
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35), // 바깥쪽 둥근 모서리
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 15,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              elevation: 0,
              backgroundColor: Colors.transparent, // 배경 투명 처리
              selectedItemColor: const Color(0xFF4C53EA), // 선택 시 파란색
              unselectedItemColor: const Color(0xFF8E8E93), // 비선택 시 회색
              selectedFontSize: 13,
              unselectedFontSize: 12,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book_rounded),
                  label: "Subjects",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Symbols.translate),
                  label: "FAQ's",
                ),
              ],
            ),
          ),
        )
    );
  }

  //여기부터는 커스텀 위젯 정의임

  Widget _buildCard(String subject, Color subjectColor, Color containerColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: 170,
        height: 100,

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.withOpacity(0.09)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              SizedBox(height: 10,),
              Text(
                'Law of Motion',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),

              SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: containerColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          subject, //과목명
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            color: subjectColor
                          ),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),

                        Icon(Symbols.pace, color: Colors.red,),
                        Text(
                          '1d:10Hr', //남은 시간
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.red
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubjectCard(Color boxColor1, Color boxColor2 ,String subject) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: 170,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: [
                boxColor1,
                boxColor2
              ],
              begin: Alignment.centerLeft,
              end: Alignment.topRight
          ),
        ),
        child: Align(
          alignment: Alignment.center,

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
            child: Text(
              subject, //과목명
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}