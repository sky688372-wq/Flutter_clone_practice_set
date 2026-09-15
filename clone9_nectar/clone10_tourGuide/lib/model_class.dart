import 'package:flutter/material.dart';

class Category {
  //필드
  final String imgPath;
  final String text;

  //생성자
  Category({required this.imgPath, required this.text});

  //카테고리 컨테이너 함수
  static Padding buildCategory({
    required String imgPath,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Container(
        height: 50,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.withValues(alpha: 0.15),
        ),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                clipBehavior: Clip.hardEdge,
                child: Image.asset(imgPath, fit: BoxFit.cover),
              ),

              SizedBox(width: 10),

              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Popular {
  String imgPath;
  String text;
  double rating;
  bool isFavorite;

  Popular({
    required this.imgPath,
    required this.text,
    required this.rating,
    required this.isFavorite,
  });
}

class TravelInfo {
  String text;
  IconData icon;
  Color iconColor;

  TravelInfo({required this.text, required this.icon, required this.iconColor});

  static Widget buildTravelInfo({
    required String text,
    required IconData icon,
    required Color iconColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Container(
        width: 100,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),

            const SizedBox(height: 8),

            Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
