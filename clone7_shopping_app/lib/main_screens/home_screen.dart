import 'package:clone_pr2/main_screens/detail_screens/detail_screen.dart';
import 'package:clone_pr2/main_screens/model_class/filter.dart';
import 'package:clone_pr2/main_screens/model_class/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  //공용 위젯으로 사용하기 위해서 static(위시 리스트 부분 에셋 구하는거 생각하면 너무 힘듦....)
  static Widget buildProductCard({
    required String imgPath, // 이미지 경로
    required String name, // 상품 이름
    required String discription, // 상품 설명
    required String price, // 할인가 (예: "56,000원")
    required String originalPrice, // 원가 (예: "90,000원")
    required String discountRate, // 할인율 (예: "40% off")
    required double rating, // 별점 점수 (예: 4.5)
    required int reviewCount, // 리뷰 수 (예: 54000)
    Function(double)? onRatingUpdate, // 별점 변경 이벤트 (선택임)
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상단 이미지 영역
              SizedBox(
                width: double.infinity,
                height: 120,
                child: Image.asset(imgPath, fit: BoxFit.cover),
              ),

              // 하단 텍스트 및 정보 영역
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 상품 이름
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 2),

                    // 상품 설명
                    Text(
                      discription,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),

                    // 할인가
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    // 원가 & 할인율
                    Row(
                      children: [
                        Text(
                          originalPrice,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          discountRate,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF43756),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),

                    // 별점 및 리뷰 수 영역
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RatingBar(
                          itemSize: 14,
                          initialRating: rating,
                          itemCount: 5,
                          allowHalfRating: true,
                          itemPadding: const EdgeInsets.only(right: 2),
                          ratingWidget: RatingWidget(
                            full: const Icon(Icons.star, color: Colors.amber),
                            half: const Icon(
                              Icons.star_half,
                              color: Colors.amber,
                            ),
                            empty: const Icon(
                              Icons.star_border,
                              color: Colors.amber,
                            ),
                          ),
                          onRatingUpdate: onRatingUpdate ?? (rating) {},
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$reviewCount',
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
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
      ),
    );
  }

  //상품 카드를 제공하는 변수
  static List<ProductCard> productList = [
    ProductCard(
      imgPath: "assets/product_card/sneakers.jpg",
      name: "Nike Air Max",
      description: "Comfortable daily sneakers for men",
      price: "56,000원",
      originalPrice: "90,000원",
      discountRate: "40% off",
      rating: 4.5,
      reviewCount: 56000,
    ),
    ProductCard(
      imgPath: "assets/product_card/casual_denim Jacket.jpg",
      name: "Casual Denim Jacket",
      description: "Stylish blue denim jacket for autumn",
      price: "42,000원",
      originalPrice: "70,000원",
      discountRate: "40% off",
      rating: 4.0,
      reviewCount: 12400,
    ),
    ProductCard(
      imgPath: "assets/product_card/smart_satch.jpg",
      name: "Smart Watch Series 8",
      description: "Fitness tracker and health monitor",
      price: "128,000원",
      originalPrice: "160,000원",
      discountRate: "20% off",
      rating: 4.8,
      reviewCount: 89000,
    ),
    ProductCard(
      imgPath: "assets/product_card/bacpack.jpg",
      name: "Classic Leather Backpack",
      description: "Durable laptop backpack for daily use",
      price: "35,000원",
      originalPrice: "50,000원",
      discountRate: "30% off",
      rating: 4.2,
      reviewCount: 3100,
    ),
    ProductCard(
      imgPath: "assets/product_card/hoodie.jpg",
      name: "Oversized Cotton Hoodie",
      description: "Soft and warm street style hoodie",
      price: "29,000원",
      originalPrice: "58,000원",
      discountRate: "50% off",
      rating: 4.7,
      reviewCount: 45200,
    ),
    ProductCard(
      imgPath: "assets/product_card/wireless_nise_canceling.jpg",
      name: "Wireless Noise Canceling",
      description: "High quality Bluetooth headphones",
      price: "89,000원",
      originalPrice: "119,000원",
      discountRate: "25% off",
      rating: 4.6,
      reviewCount: 23100,
    ),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //장르 선택 circle를 위한 리스트
  List<Filter> filterList = [
    Filter(name: "Beauty", imgPath: "assets/filter/beauty.jpg"),
    Filter(name: "fashion", imgPath: 'assets/filter/fashion.jpg'),
    Filter(name: "kids", imgPath: 'assets/filter/kids.jpg'),
    Filter(name: 'mens', imgPath: 'assets/filter/mens.jpg'),
    Filter(name: 'womens', imgPath: 'assets/filter/womens.jpg'),
  ];

  // 검색어 컨트롤러
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "All Featured",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Chip(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide.none,
                          ),
                          padding: const EdgeInsets.all(2),
                          label: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sort',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 3),
                              Icon(Icons.swap_vert, color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                      Chip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide.none,
                        ),
                        padding: const EdgeInsets.all(2),
                        label: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Filter',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 3),
                            Icon(
                              Icons.filter_alt_outlined,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              //여기가 장르 선택 Circle들 나오는 부분
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.withValues(alpha: 0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filterList.length,
                    itemBuilder: (context, index) {
                      final item = filterList[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "현재 해당 기능은 준비중입니다.",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    backgroundColor: Colors.blue,
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  item.imgPath,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              //여기서부터 컨테이너로 된 큰 이벤트 창
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/filter/shoppping_bag.jpg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),

                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "50-40% OFF",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pinkAccent,
                                  ),
                                ),
                                const Text(
                                  'Now in (product)',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  'All colours',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),

                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor: Colors.transparent,
                                    side: const BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'shop now',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
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
                ),
              ),

              //남은 시간 알림 컨테이너
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deal of the Day',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.alarm, color: Colors.white),
                              SizedBox(width: 5),
                              Text(
                                '22h 55m 20s remaining',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          side: const BorderSide(
                            color: Colors.white,
                            width: 1.5,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'View all',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 290,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: HomeScreen.productList.length,
                  itemBuilder: (context, index) {
                    final currentProduct = HomeScreen.productList[index];

                    // static 메서드는 클래스 이름으로 직접 호출함
                    return GestureDetector(
                      onTap: () {
                        //디테일 스크린으로 이동
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return DetailScreen(
                            imgPath: currentProduct.imgPath,
                            name: currentProduct.name,
                            discription: currentProduct.description,
                            price: currentProduct.price,
                            originalPrice: currentProduct.originalPrice,
                            discountRate: currentProduct.discountRate,
                            rating: currentProduct.rating,
                            reviewCount: currentProduct.reviewCount,
                          );
                        },));
                      },

                      child: HomeScreen.buildProductCard(
                        imgPath: currentProduct.imgPath,
                        name: currentProduct.name,
                        discription: currentProduct.description,
                        price: currentProduct.price,
                        originalPrice: currentProduct.originalPrice,
                        discountRate: currentProduct.discountRate,
                        rating: 4,
                        reviewCount: 56000,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              //스페셜 오퍼 부분
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "현재 기능은 준비중입니다.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                  );
                },

                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey.withValues(alpha: 0.2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/special_offers.png',
                          width: 70,
                          height: 70,
                        ),

                        const SizedBox(width: 20),

                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Special Offers',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'We make sure you get the offer\nyou need at best prices',
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // 구두 사진의 광고판 느낌
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.black.withValues(alpha: 0.4),
                    ),
                  ),
                  child: Stack(
                    children: [
                      // 1. 배경 이미지
                      Positioned.fill(
                        child: Image.asset(
                          'assets/images/heels.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),

                      // 2. 가독성을 위한 왼쪽 세로 그라데이션 오버레이
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.black.withValues(alpha: 0.6),
                                Colors.black.withValues(alpha: 0.2),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),

                      // 3. 텍스트 콘텐츠
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Flat and Heels',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                letterSpacing: 0.5,
                                shadows: [
                                  Shadow(
                                    offset: Offset(0, 2),
                                    blurRadius: 4,
                                    color: Colors.black45,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 6),

                            Text(
                              'Stand a chance to get rewarded',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withValues(alpha: 0.9),
                                shadows: const [
                                  Shadow(
                                    offset: Offset(0, 1),
                                    blurRadius: 3,
                                    color: Colors.black38,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // 4. 우측 하단 버튼 (Shop Now)
                      Positioned(
                        right: 16,
                        bottom: 16,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF43756),
                            foregroundColor: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "현재 기능은 준비중입니다.",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: Colors.blue,
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Visit now',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.arrow_forward_ios, size: 12),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //핑크색의 컨테이너
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.pinkAccent.withValues(alpha: 0.65),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),

                          Text(
                            "Trending Products",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.calendar_month, color: Colors.white),
                              Text(
                                "Last Date 29/02/22",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: const BorderSide(color: Colors.white, width: 1.5),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "현재 기능은 준비중입니다.",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              backgroundColor: Colors.blue,
                            ),
                          );
                        },
                        child: const Text(
                          'View all',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// 임시로 똑같은 리스트 빌더로 대체함
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: HomeScreen.productList.length,
                  itemBuilder: (context, index) {
                    final currentProduct = HomeScreen.productList[index];

                    // static 메서드는 클래스 이름으로 직접 호출
                    return GestureDetector(
                      onTap: () {
                        //디테일 스크린으로 이동
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return DetailScreen(
                            imgPath: currentProduct.imgPath,
                            name: currentProduct.name,
                            discription: currentProduct.description,
                            price: currentProduct.price,
                            originalPrice: currentProduct.originalPrice,
                            discountRate: currentProduct.discountRate,
                            rating: currentProduct.rating,
                            reviewCount: currentProduct.reviewCount,
                          );
                        },));
                      },

                      child: HomeScreen.buildProductCard(
                        imgPath: currentProduct.imgPath,
                        name: currentProduct.name,
                        discription: currentProduct.description,
                        price: currentProduct.price,
                        originalPrice: currentProduct.originalPrice,
                        discountRate: currentProduct.discountRate,
                        rating: 4,
                        reviewCount: 56000,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1.상단 이벤트 이미지
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Image.asset(
                        'assets/images/summer_event.png',
                        fit: BoxFit.cover,
                      ),
                    ),

                    // 2. 하단 텍스트 및 버튼 영역
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'New Arrivals',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Summer' 25 Collections",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),

                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF3355),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              elevation: 0,
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'View all',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(Icons.arrow_forward, size: 18),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //스폰서 부분
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Container(
                  width: double.infinity,
                  color: Colors.grey.withValues(alpha: 0.2),

                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Sponsored',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/sponserd.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Text(
                                'up to 50% off',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}