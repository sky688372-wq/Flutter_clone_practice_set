import 'package:clone_pr3/detail_screen.dart';
import 'package:clone_pr3/model_class.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //텍스트 컨트롤러
  final TextEditingController textEditingController = TextEditingController();

  //개발 중 메세지 표시 함수
  void _showBuilding() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
        content: Text(
          '현재 개발중인 기능입니다.',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  //카테고리 리스트
  List<Category> category = [
    Category(imgPath: 'assets/images/top30.png', text: 'Top 30 places'),
    Category(imgPath: 'assets/images/nature.png', text: 'Nature'),
    Category(imgPath: 'assets/images/food.png', text: 'Gastro'),
  ];

  //Popular 카드 리스트 부분
  List<Popular> popular = [
    Popular(
      imgPath: 'assets/images/Salavat Yulaev.png',
      text: 'Monument to\nSalavat Yulaev',
      rating: 4.9,
      isFavorite: true,
    ),
    Popular(
      imgPath: 'assets/images/Krasnyy klyuch (2).png',
      text: 'Krasnyy klyuch\nspring',
      rating: 5.0,
      isFavorite: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. 상단 텍스트와 아이콘 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Bashkortostan',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _showBuilding,
                    icon: const Icon(
                      Icons.map_outlined,
                      color: Colors.pink,
                      size: 30,
                    ),
                  ),
                ],
              ),

              // 2. 상단 'Bashkortostan' 밑의 텍스트
              const Text(
                'Choose another',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 10),

              // 3. 검색 텍스트 필드
              TextField(
                controller: textEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withValues(alpha: 0.13),
                  hintText: 'Enter name or category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _showBuilding();
                    },
                    icon: const Icon(Icons.search, size: 30),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 4. 카테고리(텍스트와 리스트 부분)
              const Text(
                'Category',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 10),

              //카테고리 가로 스크롤 위젯들
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      final item = category[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: GestureDetector(
                          onTap: _showBuilding,

                          child: Category.buildCategory(
                            imgPath: item.imgPath,
                            text: item.text,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              //5.popular 부분
              const Text(
                'Popular',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 10),

              //가로 리스트 뷰 카드 부분
              SizedBox(
                width: double.infinity,
                height: 300,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popular.length,
                  itemBuilder: (context, index) {
                    final item = popular[index];

                    return Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                imgPath: item.imgPath,
                                name: item.text,
                                isFavorite: item.isFavorite,
                              ),
                            ),
                          );
                        },

                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          width: 220,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.asset(
                                  item.imgPath,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              //좋아요 버튼
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        popular[index].isFavorite =
                                            !popular[index].isFavorite;
                                      });
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        item.isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border_rounded,
                                        color: Colors.pink,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //카드의 장소 이름
                                      Text(
                                        item.text,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),

                                      SizedBox(height: 12),

                                      //카드 장소의 별점
                                      Chip(
                                        avatar: const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 23,
                                        ),
                                        label: Text(
                                          '${item.rating}',
                                          style: TextStyle(
                                            color: Colors.white.withValues(
                                              alpha: 0.75,
                                            ),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        backgroundColor: Colors.black
                                            .withValues(alpha: 0.5),
                                        side: BorderSide.none,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4,
                                          vertical: 0,
                                        ),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      //바텀 네비게이션 바
      bottomNavigationBar: Container(
        margin: EdgeInsetsGeometry.symmetric(vertical: 12, horizontal: 8),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          color: Colors.grey.withValues(alpha: 0.15),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
              label: "favorite",
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: "chat",
              icon: Icon(Icons.wechat_outlined),
            ),
            BottomNavigationBarItem(
              label: "setting",
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
