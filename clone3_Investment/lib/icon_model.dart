import 'package:flutter/cupertino.dart';

class IconModel {
  IconData icon;
  String payBack;
  String name;
  Color color;

  IconModel({required this.icon, required this.payBack, required this.name, required this.color});
}

class Post {
  String name;
  String body;
  String imgPath;

  Post({required this.name, required this.body, required this.imgPath});

}