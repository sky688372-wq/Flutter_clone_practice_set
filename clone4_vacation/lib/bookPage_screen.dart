import 'package:flutter/material.dart';

class BookpageScreen extends StatefulWidget {
  const BookpageScreen({super.key});

  @override
  State<BookpageScreen> createState() => _BookpageScreenState();
}

class _BookpageScreenState extends State<BookpageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("book"),
      ),
    );
  }
}
