class ProductCard {
  final String imgPath; //이미지 경로
  final String name; //제품 이름
  final String description; // 제품 설명
  final String price; //제품 가격
  final String originalPrice; //원래 제품 가격(할인 전 가격)
  final String discountRate; // 할인 퍼센테이지
  final double rating; // 별점
  final int reviewCount; //리뷰 수

  ProductCard({ // 생성자
    required this.imgPath,
    required this.name,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.discountRate,
    required this.rating,
    required this.reviewCount,
  });
}