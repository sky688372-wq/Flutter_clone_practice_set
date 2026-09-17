import 'package:clone_pr/function/app_functions.dart';
import 'package:clone_pr/model_class/model_class.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  List<Category> category = [
    Category(imgPath: 'assets/category/Media.png', name: 'Vegetable', count: 43),
    Category(imgPath: 'assets/category/Media(1).png', name: 'Fruits', count: 32),
    Category(imgPath: 'assets/category/Media(2).png', name: 'Bread', count: 22),
    Category(imgPath: 'assets/category/Media(3).png', name: 'Sweets', count: 56),
    Category(imgPath: 'assets/category/Media(4).png', name: 'Pasta', count: 43),
    Category(imgPath: 'assets/category/Media(5).png', name: 'Drinks', count: 43),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. 상단 텍스트
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 20),

                //2. 텍스트 필드
                SizedBox(
                  width: double.infinity,
                  height: 45,

                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: IconButton(
                        onPressed: () {
                          AppFunctions.showBuilding(context);
                        },
                        icon: Icon(Icons.search),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.grey.withValues(alpha: 0.7)
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40,),

                // 3. 상품 목록 : Wrap 위젯 사용
                LayoutBuilder(
                  builder: (context, constraints) {
                    // spacing 간격(16)을 고려하여 카드 1개의 너비 계산
                    final double cardWidth = (constraints.maxWidth - 16) / 2;

                    return Wrap(
                      spacing: 16, // 좌우 아이템 간격
                      runSpacing: 16, // 위아래 줄 간격
                      children: category.map((item) {
                        return Container(
                          width: cardWidth,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 상단 이미지 부분
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(15),
                                ),
                                child: Image.asset(
                                  item.imgPath,
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              // 하단 텍스트 영역
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF2D0C57),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '(${item.count})',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}