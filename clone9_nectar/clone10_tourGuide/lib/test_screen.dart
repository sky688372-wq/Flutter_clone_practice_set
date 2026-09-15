import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  
  //통신 함수
  Future<void> _test() async {
    final url = Uri.parse('http://210.114.17.158:8000/api/v1/analysis/50/atmq ');

    try {
      final response = await http.get(url);

      if(response.statusCode == 200){
        print(response.body);
      } else {
        print("통신 오류 ${response.statusCode}");
      }
    }catch(e) {
      print("실패 $e");
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _test();
  }


  
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

