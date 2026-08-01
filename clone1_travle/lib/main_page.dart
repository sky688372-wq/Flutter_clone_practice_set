import 'dart:ui'; // 🌟 BackdropFilter 사용을 위해 필수
import 'package:clone_pr/detail_screen.dart';
import 'package:flutter/material.dart';

// 1. Popular 장소 데이터 모델
class PlaceItem {
  final String name;
  final String imagePath;
  final double rating;
  bool isFavorite;

  PlaceItem({
    required this.name,
    required this.imagePath,
    required this.rating,
    this.isFavorite = false,
  });
}

// 2. Recommended 데이터 모델
class RecommendedItem {
  final String title;
  final String imagePath;
  final String duration; // 예: '4N/5D'

  RecommendedItem({
    required this.title,
    required this.imagePath,
    required this.duration,
  });
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 카테고리 목록
  final List<String> categories = [
    'Location',
    'Hotels',
    'Food',
    'Adventure',
    'Activities'
  ];

  int selectedIndex = 0; // 카테고리 선택 인덱스
  int currentNavIndex = 0; // 바텀 네비게이션 선택 인덱스

  // Popular 리스트
  final List<PlaceItem> places = [
    PlaceItem(
      name: 'Alley Palace',
      imagePath: 'assets/images/place_img/img1.png',
      rating: 4.1,
      isFavorite: false,
    ),
    PlaceItem(
      name: 'Coeurdes Alpes',
      imagePath: 'assets/images/place_img/img2.jpeg',
      rating: 4.5,
      isFavorite: false,
    ),
    PlaceItem(
      name: 'Montparnasse Tower',
      imagePath: 'assets/images/place_img/img3.png',
      rating: 4.8,
      isFavorite: false,
    ),
    PlaceItem(
      name: 'Eiffel Tower',
      imagePath: 'assets/images/place_img/img4.png',
      rating: 4.5,
      isFavorite: false,
    ),
    PlaceItem(
      name: 'Louvre Museum',
      imagePath: 'assets/images/place_img/img5.png',
      rating: 4.9,
      isFavorite: false,
    ),
  ];

  final List<RecommendedItem> recommendedList = [
    RecommendedItem(
      title: 'Explore Aspen',
      imagePath: 'assets/images/place_img/img1.png',
      duration: '4N/5D',
    ),
    RecommendedItem(
      title: 'Luxurious Aspen',
      imagePath: 'assets/images/place_img/img2.jpeg',
      duration: '2N/3D',
    ),
    RecommendedItem(
      title: 'Aspen Adventure',
      imagePath: 'assets/images/place_img/img3.png',
      duration: '3N/4D',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 🌟 핵심 해결책: 바디 영역을 바텀 네비게이션 바 아래까지 확장합니다.
      extendBody: true,

      // extendBody를 사용하면 SafeArea의 bottom 패딩이 무시될 수 있으므로 SafeArea 설정 조정이 필요할 수 있습니다.
      body: SafeArea(
        bottom: false, // 하단 영역까지 콘텐츠가 내려가게 함
        child: SingleChildScrollView(
          // 🌟 마지막 리스트 아이템이 바텀 네비게이션 바에 가려지지 않도록 bottom 패딩을 100 정도로 넉넉하게 줍니다.
          padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // 1. 상단 Header & 위치 선택
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Explore',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(20),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16,
                          color: Color(0xFF1976D2),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Aspen, USA',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 18,
                          color: Color(0xFF1976D2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // 2. 메인 타이틀 "Aspen"
              const Text(
                'Aspen',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 0.5,
                ),
              ),

              const SizedBox(height: 24),

              // 3. 검색창
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F8FE),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: const Row(
                  children: [
                    Icon(
                      Icons.search_rounded,
                      color: Colors.grey,
                      size: 22,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Find things to do',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 4. 가로 스크롤 카테고리 탭
              SizedBox(
                height: 48,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final isSelected = selectedIndex == index;

                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        borderRadius: BorderRadius.circular(24),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFFF3F8FE)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Center(
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                color: isSelected
                                    ? const Color(0xFF1976D2)
                                    : Colors.black38,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 28),

              // 5. Popular 섹션 헤더
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1976D2),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 16),

              // 6. Popular 가로 스크롤 카드 리스트
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    final place = places[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              name: place.name,
                              img: place.imagePath,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 180,
                        margin: const EdgeInsets.only(right: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.asset(
                                  place.imagePath,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(color: Colors.grey[300]);
                                  },
                                ),
                              ),
                              Positioned.fill(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF4D5652)
                                              .withOpacity(0.85),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          place.name,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF4D5652)
                                                  .withOpacity(0.85),
                                              borderRadius:
                                              BorderRadius.circular(16),
                                            ),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.star_rounded,
                                                  color: Colors.amber,
                                                  size: 16,
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  '${place.rating}',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                place.isFavorite =
                                                !place.isFavorite;
                                              });
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                place.isFavorite
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: place.isFavorite
                                                    ? Colors.redAccent
                                                    : Colors.grey,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 28),

              // 7. Recommended 타이틀
              const Text(
                'Recommended',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 16),

              // 8. Recommended 가로 스크롤 카드 영역
              SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendedList.length,
                  itemBuilder: (context, index) {
                    final item = recommendedList[index];

                    return Container(
                      width: 180,
                      margin: const EdgeInsets.only(right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 110,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      item.imagePath,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                            color: Colors.grey[300]);
                                      },
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 8,
                                  bottom: 8,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF3A544F),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Text(
                                      item.duration,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item.title,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),

      // 투명도(BackdropFilter)가 적용된 플로팅 바텀 네비게이션 바
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        height: 72,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          // 투명 배경일 때 그림자가 겹쳐 보이면 지저분할 수 있으므로, 원하신다면 아래 boxShadow는 제거하셔도 됩니다.
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1976D2).withOpacity(0.12),
              blurRadius: 24,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(36),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.white.withOpacity(0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(0, Icons.home_rounded),
                  _buildNavItem(1, Icons.confirmation_num_outlined),
                  _buildNavItem(2, Icons.favorite_border_rounded),
                  _buildNavItem(3, Icons.person_outline_rounded),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 네비게이션 아이템 칩 빌더
  Widget _buildNavItem(int index, IconData icon) {
    final isSelected = currentNavIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentNavIndex = index;
        });
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1976D2) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey[600], // 아이콘 색상을 조금 더 진하게 조정했습니다.
          size: 24,
        ),
      ),
    );
  }
}