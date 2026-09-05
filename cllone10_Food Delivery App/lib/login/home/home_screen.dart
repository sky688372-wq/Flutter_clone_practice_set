import 'package:clone_pr/menu/food1.dart';
import 'package:clone_pr/menu/hamburger.dart';
import 'package:clone_pr/menu/pancake.dart';
import 'package:clone_pr/menu/pizza.dart';
import 'package:clone_pr/menu/salad.dart';
import 'package:clone_pr/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //검색 컨틀로러
  final TextEditingController _searchCtrl = TextEditingController();

  //페이지뷰 컨트롤러
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SplashScreen.yellow,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 45,
                          child: TextField(
                            controller: _searchCtrl,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  //누르면 반응할 로직
                                },
                                icon: CircleAvatar(
                                  backgroundColor: SplashScreen.orange,
                                  child: Icon(Icons.tune, color: Colors.white),
                                ),
                              ),

                              filled: true,
                              fillColor: Colors.white,
                              label: Text(
                                'Search',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 10),

                      //쇼핑 카트 아이콘
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: GestureDetector(
                          onTap: () {
                            //누르면 반응 이벤트 처리
                          },

                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.shopping_cart_outlined),
                          ),
                        ),
                      ),

                      //알림 아이콘
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: GestureDetector(
                          onTap: () {
                            //누르면 반응 이벤트 처리
                          },

                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.alarm),
                          ),
                        ),
                      ),

                      // 마이페이지 아이콘
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: GestureDetector(
                          onTap: () {
                            //누르면 반응 이벤트 처리
                          },

                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 6),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        Text(
                          "Rise and shine! It's breakfast time",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: SplashScreen.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),

          // 2. 메인 콘텐츠 컨테이너
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: SingleChildScrollView( //컨테이너 안에서만 스크롤 가능하도록 하는 부분
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildFoodKind(
                            imgPath: "assets/food_kind/Frame 26.png",
                            kindName: "Snacks",
                          ),
                          _buildFoodKind(
                            imgPath: "assets/food_kind/Frame 26 (1).png",
                            kindName: "Meal",
                          ),
                          _buildFoodKind(
                            imgPath: "assets/food_kind/Frame 26 (2).png",
                            kindName: "Vegan",
                          ),
                          _buildFoodKind(
                            imgPath: "assets/food_kind/Frame 26 (3).png",
                            kindName: "Dessert",
                          ),
                          _buildFoodKind(
                            imgPath: "assets/food_kind/Frame 26 (4).png",
                            kindName: "Drinks",
                          ),
                        ],
                      ),
                  
                      SizedBox(width: double.infinity, child: Divider()),
                  
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Best Seller",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                  
                          //View all 부분
                          GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: SplashScreen.orange,
                                  content: const Text(
                                    "해당 기능은 준비중입니다.",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            },
                  
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "View all",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: SplashScreen.orange,
                                  ),
                                ),
                  
                                SizedBox(width: 6),
                  
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: SplashScreen.orange,
                                  size: 17,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  
                      SizedBox(height: 10),
                  
                      //베스트 셀러 부분
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildBestSeller(
                              imgPath: 'assets/best_seller/Rectangle 133.png',
                              price: "103.0",
                            ),
                            _buildBestSeller(
                              imgPath: 'assets/best_seller/Rectangle 134.png',
                              price: "50.0",
                            ),
                            _buildBestSeller(
                              imgPath: 'assets/best_seller/Rectangle 135.png',
                              price: "12.99",
                            ),
                            _buildBestSeller(
                              imgPath: 'assets/best_seller/Rectangle 136.png',
                              price: "8.20",
                            ),
                          ],
                        ),
                      ),
                  
                      SizedBox(height: 20),
                  
                      //todo : 나중에 페이지 뷰와 스무스 인디케이터로 조정해야함 -> 스무스 인디케이터 패키지를 찬양하자
                      SizedBox(
                        width: double.infinity,
                        height: 140,
                        child: PageView(
                          scrollDirection: Axis.horizontal,
                          controller: _pageController,
                          children: [
                            Pizza(),
                            Hamburger(),
                            Food1(),
                            Pancake(),
                            Salad()
                          ],
                        ),
                      ),
                  
                      SizedBox(height: 10,),
                  
                      SmoothPageIndicator(
                          controller: _pageController,
                          count: 5,
                        onDotClicked: (index) {
                          _pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut
                          );
                        },
                        effect: WormEffect(
                          dotHeight: 7,
                          dotWidth: 20,
                          dotColor: Colors.grey,
                          activeDotColor: SplashScreen.orange
                        ),
                      ),

                      SizedBox(height: 20,),

                      //추천 메뉴 부분
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Recommend",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),
                        ),
                      ),

                      SizedBox(height: 15,),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildRecommend(imgPath: "assets/images/salad.png"),
                            _buildRecommend(imgPath: "assets/images/food1.png"),
                          ],
                        ),
                      )
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

  //음식 종류 커스텀 위젯
  Widget _buildFoodKind({required String imgPath, required String kindName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: SplashScreen.orange,
              content: const Text(
                "해당 기능은 준비중입니다.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(imgPath),
            Text(
              kindName,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //베스트 셀러 커스텀 위젯
  Widget _buildBestSeller({required String imgPath, required String price}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        width: 100,
        height: 120,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            // 1. 전체 배경 이미지
            Positioned.fill(child: Image.asset(imgPath, fit: BoxFit.cover)),

            // 2. 우측 하단 가격표 라벨
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: SplashScreen.orange,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  "\$$price",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildRecommend({required String imgPath}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 220,
        height: 150,

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
        ),
        clipBehavior: Clip.hardEdge,


        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                imgPath,
                fit: BoxFit.cover,
              ),
            ),

            //상단 평점 부분
            Padding(
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 17,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '5.0',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.yellow,
                        ),

                        SizedBox(width: 10,),
                      ],
                    ),
                  ),

                  SizedBox(width: 10,),

                  SizedBox(
                    width: 22,
                    height: 22,
                    child: CircleAvatar(

                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        size: 16,
                        color: Colors.pink,
                      ),
                    ),
                  )
                ],
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  width: 50,
                  height: 21,
                  color: SplashScreen.orange,
                  child: Center(
                    child: Text(
                      '\$10.0',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}