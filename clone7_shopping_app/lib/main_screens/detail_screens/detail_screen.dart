import 'package:clone_pr2/main_screens/detail_screens/check_out_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.imgPath,
    required this.name,
    required this.discription,
    required this.price,
    required this.originalPrice,
    required this.discountRate,
    required this.rating,
    required this.reviewCount,
  });

  final String imgPath;
  final String name;
  final String discription;
  final String price;
  final String originalPrice;
  final String discountRate;
  final double rating;
  final int reviewCount;

  //기본 정보들 필수적으로 받아두어야 함

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String? size = "7 Uk"; // 사이즈를 저장하는 변수

  //사이즈들의 리스트
  List<String> sizes = ["6 Uk", "7 Uk", "8 Uk", "9 Uk", "10 Uk"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //이전으로 가는 버튼은 자동으로 생기니까 ㄱㅊ음
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CircleAvatar(
              backgroundColor: Colors.grey.withValues(alpha: 0.2),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
          ),
        ],
      ),

      // 네비게이션 바
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              // 1. 장바구니 아이콘 버튼
              Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("장바구니에 담겼습니다.")),
                    );
                  },
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // 2. 구매하기 버튼 (Buy Now)
              Expanded(
                child: SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF43756),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOutScreen()));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.flash_on, color: Colors.white, size: 20),
                        SizedBox(width: 6),
                        Text(
                          'Buy Now',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      //메인 콘텐츠
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //상품 이미지
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    widget.imgPath,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),

                //상품 사이즈들
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Size : ${size ?? ''}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                // 사이즈 선택 칩 목록
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: sizes.map((currentSize) {
                    final isSelected = size == currentSize;
                    return ChoiceChip(
                      label: Text(
                        currentSize,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      selected: isSelected,
                      selectedColor: const Color(0xFFF43756),
                      // 빨강에 가까운 컬러
                      backgroundColor: Colors.grey.shade200,
                      showCheckmark: false,
                      // 체크 표시 비활성화
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: isSelected
                              ? const Color(0xFFF43756)
                              : Colors.transparent,
                        ),
                      ),
                      onSelected: (bool selected) {
                        setState(() {
                          size = selected ? currentSize : null;
                        });
                      },
                    );
                  }).toList(),
                ),

                const SizedBox(height: 10),

                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                RatingBar(
                  itemSize: 24,
                  initialRating: widget.rating,
                  itemCount: 5,
                  allowHalfRating: true,
                  itemPadding: const EdgeInsets.only(right: 2),
                  ratingWidget: RatingWidget(
                    full: const Icon(Icons.star, color: Colors.amber),
                    half: const Icon(Icons.star_half, color: Colors.amber),
                    empty: const Icon(Icons.star_border, color: Colors.amber),
                  ),
                  onRatingUpdate: (value) {
                    //평점 변경 로직이나 안해도 됨
                  },
                ),

                //가격 부분
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.price,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      widget.originalPrice,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),

                    const SizedBox(width: 6),

                    Text(
                      widget.discountRate,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF43756),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                const Text(
                  "Product Discription",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                Text(
                  widget.discription,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),

                const SizedBox(height: 10),

                // chip들
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Chip(
                          label: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.location_on_outlined, size: 20),

                              SizedBox(width: 4),

                              Text(
                                'Nearest Store',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Chip(
                          label: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.lock, size: 20),

                              SizedBox(width: 4),

                              Text(
                                'VIP',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Chip(
                          label: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.published_with_changes, size: 20),

                              SizedBox(width: 4),

                              Text(
                                'Return policy',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
