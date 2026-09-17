class Category {
  String imgPath;
  String name;
  int count;

  Category({required this.imgPath, required this.name, required this.count});
}

class Product { //카테고리 선택 후 들어갈 부분에서 보여줄 price부분
  String imgPath;
  String name;
  double price;
  String unit;

  Product({required this.imgPath, required this.name, required this.price, required this.unit});
}