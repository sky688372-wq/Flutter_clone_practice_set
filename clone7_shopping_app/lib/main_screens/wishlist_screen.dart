import 'package:clone_pr2/main_screens/detail_screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart'; //상품 카드 만드려고 임포트
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'; //그리드 뷰 패키지

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  //검색 컨트롤러
  final TextEditingController _searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //검색창
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: _searchCtrl,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Search any Products",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),

                    //앞의 아이콘
                    prefixIcon: IconButton(
                      onPressed: () {
                        //서치 검색 기능
                      },
                      icon: const Icon(Icons.search, size: 25),
                    ),

                    //뒤의 아이콘
                    suffixIcon: IconButton(
                      onPressed: () {
                        //누르면 이벤트 처리하는 부분
                      },
                      icon: const Icon(Icons.keyboard_voice_outlined, size: 25),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // 위시리스트 상품 개수 표시
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${HomeScreen.productList.length} Items',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // 매스너리 그리드로 상품 배치
              MasonryGridView.count(
                shrinkWrap: true, // SingleChildScrollView 안에 있으므로 필수인 파라미터임
                physics: const NeverScrollableScrollPhysics(), // 이중 스크롤 방지
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                itemCount: HomeScreen.productList.length,
                itemBuilder: (context, index) {
                  final product = HomeScreen.productList[index];

                  // HomeScreen에 public static으로 선언된 메서드 직접 호출하는 부분
                  return GestureDetector(
                    onTap: () {
                      //디테일 스크린으로 이동
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return DetailScreen(
                          imgPath: product.imgPath,
                          name: product.name,
                          discription: product.description,
                          price: product.price,
                          originalPrice: product.originalPrice,
                          discountRate: product.discountRate,
                          rating: product.rating,
                          reviewCount: product.reviewCount,
                        );
                      },));
                    },
                    
                    child: HomeScreen.buildProductCard(
                      imgPath: product.imgPath,
                      name: product.name,
                      discription: product.description,
                      price: product.price,
                      originalPrice: product.originalPrice,
                      discountRate: product.discountRate,
                      rating: product.rating,
                      reviewCount: product.reviewCount,
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}