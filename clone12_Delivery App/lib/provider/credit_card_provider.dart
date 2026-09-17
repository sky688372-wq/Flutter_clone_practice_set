import 'package:flutter/material.dart';

class CreditCardProvider extends ChangeNotifier {
  String cardNumber = "4747 4747 4747"; // 카드 넘버
  String nameOnCard = "Alex"; //이름
  String expireDate = "07/21"; //만료 날짜
  String cvc = "474"; //cvc

  // 카드 넘버 변경 함수
  void changeCardNumber(String newCardNumber, BuildContext context) {
    cardNumber = newCardNumber;

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.blue,
        content: Text('카드 번호 변경 완료'),
      ),
    );
    notifyListeners();
  }

  // 카드 이름 변경 함수
  void changeCardName(String newCardName, BuildContext context) {
    nameOnCard = newCardName;

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.blue,
        content: Text('이름 변경 완료'),
      ),
    );
    notifyListeners();
  }

  // 만료일 변경 함수
  void changeExpireDate(String newExpireDate) {
    expireDate = newExpireDate;
    notifyListeners();
  }

  // CVC 변경 함수
  void changeCvc(String newCvc) {
    cvc = newCvc;
    notifyListeners();
  }
}