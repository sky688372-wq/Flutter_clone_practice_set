import 'package:clone_pr/bookPage_screen.dart';
import 'package:clone_pr/place_model.dart';
import 'package:flutter/material.dart';

class MainpageScreen extends StatefulWidget {
  const MainpageScreen({super.key});

  @override
  State<MainpageScreen> createState() => _MainpageScreenState();
}

class _MainpageScreenState extends State<MainpageScreen> {
  // 여행지 10곳으로 채워진 PlaceModel 리스트
  List<PlaceModel> place = [
    PlaceModel(
      name: "Tokyo Tower",
      location: "도쿄, 일본",
      distance: "1,180 Km",
      imgPath: "assets/images/place/tokyo_tower.jpg",
      isLike: false,
    ),
    PlaceModel(
      name: "Sun World Ba Na Hills",
      location: "다낭, 베트남",
      distance: "3,000 Km",
      imgPath:
          "assets/images/place/[MuslimFriendly]SunWorldBaNaHillsDayTourwithHalalBuffet.jpg",
      isLike: false,
    ),
    PlaceModel(
      name: "The Grand Palace",
      location: "방콕, 태국",
      distance: "3,700 Km",
      imgPath: "assets/images/place/Grand-Palace-and-wat-phra-kaew.jpg",
      isLike: false,
    ),
    PlaceModel(
      name: "Uluwatu Temple",
      location: "발리, 인도네시아",
      distance: "5,290 Km",
      imgPath: "assets/images/place/jcr_content.jpeg",
      isLike: false,
    ),
    PlaceModel(
      name: "Taipei 101",
      location: "타이베이, 대만",
      distance: "1,460 Km",
      imgPath: "assets/images/place/Taipei_101_Tower-E_0.jpg",
      isLike: false,
    ),
    PlaceModel(
      name: "Eiffel Tower",
      location: "파리, 프랑스",
      distance: "8,960 Km",
      imgPath: "assets/images/place/The Eiffel Tower.jpeg",
      isLike: false,
    ),
    PlaceModel(
      name: "Colosseum",
      location: "로마, 이탈리아",
      distance: "8,960 Km",
      imgPath: "assets/images/place/THE_COLOSSEUM.jpg",
      isLike: false,
    ),
    PlaceModel(
      name: "Prague Castle",
      location: "프라하, 체코",
      distance: "8,240 Km",
      imgPath: "assets/images/place/Prague_Castle.jpg",
      isLike: false,
    ),
    PlaceModel(
      name: "Waikiki Beach",
      location: "하와이, 미국",
      distance: "7,340 Km",
      imgPath: "assets/images/place/Waikiki_Beach.jpg",
      isLike: false,
    ),
    PlaceModel(
      name: "Park Güell",
      location: "바르셀로나, 스페인",
      distance: "9,590 Km",
      imgPath: "assets/images/place/Park_Güell.jpeg",
      isLike: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,

        // 1. 왼쪽 위치 정보 칩 버튼
        titleSpacing: 16,
        title: GestureDetector(
          onTap: () {
            // 위치 클릭 이벤트
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xF2F2F2F2),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.location_on, color: Color(0xFF4A80D6), size: 22),
                SizedBox(width: 8),
                Text(
                  'Denpasar, Bali',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),

        // 2. 오른쪽 프로필 이미지 영역
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                // 프로필 클릭 이벤트
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/profile.jpg',
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),

      // 메인 콘텐츠 영역
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // 상단 타이틀 텍스트
              const Text(
                'Find your Happiness\nwith Us!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 20),

              // 검색창 Container
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFFF0F0F0),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Your destination",
                            hintStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // 검색 버튼 로직
                      },
                      icon: const Icon(Icons.search, color: Colors.blue),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Popular 타이틀과 see All 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // see All 클릭 이벤트
                    },
                    child: const Text(
                      'see All',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // 가로 스크롤 카드 리스트
              SizedBox(
                height: 280, // 카드 전체 높이
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: place.length,
                  itemBuilder: (context, index) {
                    final currentPlace = place[index];

                    return Container(
                      width: 220,
                      margin: const EdgeInsets.only(right: 16),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Stack(
                        children: [
                          // 1) 카드 배경 이미지 (imgPath가 빈 값일 경우 대비 처리 가능)
                          Positioned.fill(
                            child: currentPlace.imgPath.isNotEmpty
                                ? Image.asset(
                                    currentPlace.imgPath,
                                    fit: BoxFit.cover,
                                  )
                                : Container(
                                    color: Colors.grey[300],
                                    child: const Icon(
                                      Icons.image,
                                      size: 40,
                                      color: Colors.grey,
                                    ),
                                  ),
                          ),

                          // 2) 우측 상단 좋아요(하트) 버튼
                          Positioned(
                            top: 8,
                            right: 8,
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              transitionBuilder: (Widget child, Animation<double> animation) {
                                return ScaleTransition(scale: animation, child: child);
                              },
                              child: IconButton(
                                key: ValueKey<bool>(currentPlace.isLike),
                                onPressed: () {
                                  setState(() {
                                    currentPlace.isLike = !currentPlace.isLike;
                                  });
                                },
                                icon: Icon(
                                  currentPlace.isLike ? Icons.favorite : Icons.favorite_border,
                                  color: currentPlace.isLike ? Colors.red : Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),

                          // 3) 하단 반투명 정보 박스
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.55),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // 장소명
                                    Text(
                                      currentPlace.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),

                                    // 위치 아이콘 + 위치명
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          size: 16,
                                          color: Colors.blue,
                                        ),
                                        const SizedBox(width: 4),
                                        Expanded(
                                          child: Text(
                                            currentPlace.location,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 10),

                                    // 거리 텍스트 + Route 버튼
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // 거리 정보
                                        Text(
                                          currentPlace.distance,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                          ),
                                        ),

                                        // Route 버튼
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const BookpageScreen(),));
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 8,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF4A80D6),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: const Text(
                                              'Route',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Nearest Places',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      //누르면 이벤트 처리
                    },

                    child: const Text(
                      'see All',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              // Nearest Places 리스트 빌더
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: place.length,
                itemBuilder: (context, index) {
                  final current_place = place[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Container(
                      height: 110,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            spreadRadius: 2,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            // 1. 좌측 썸네일 이미지
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Image.asset(
                                current_place.imgPath,
                                fit: BoxFit.cover,
                              ),
                            ),

                            const SizedBox(width: 12),

                            // 2. 중앙 텍스트 정보 (장소명, 위치, 거리)
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    current_place.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 14,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          current_place.location,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    current_place.distance,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // 3. 우측 Route 버튼
                            GestureDetector(
                              onTap: () {
                                // Route 클릭 이벤트
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const BookpageScreen(),));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF5A95E7),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Text(
                                  'Route',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
