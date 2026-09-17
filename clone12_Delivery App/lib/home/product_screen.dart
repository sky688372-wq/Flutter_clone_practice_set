import 'package:clone_pr/function/app_functions.dart';
import 'package:clone_pr/home/detail/credit_card_info_screen.dart';
import 'package:clone_pr/provider/credit_card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool contactDelivery = true; //마지막 상태 처리 값
  // 선택된 배달 옵션 기본값은 드론
  String selectedOption = 'By Drone';

  @override
  Widget build(BuildContext context) {
    // Provider 데이터 변수화 시키는게 더 깔끔할 듯
    final cardNumber = context.watch<CreditCardProvider>().cardNumber;
    final nameOnCard = context.watch<CreditCardProvider>().nameOnCard;

    String formatCardNumber(String number) {
      return number.replaceAll(RegExp(r'\d(?=.{4})'), '*');
    }

    return Scaffold(
      // 0. 앱바
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'CheckOut',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Payment method',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreditCardInfoScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'CHANGE',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                ),
              ],
            ),

            // 카드 정보 표시 영역
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.credit_card_outlined, color: Colors.black87),
                const SizedBox(width: 20),
                Text(
                  formatCardNumber(cardNumber),
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),

            const SizedBox(height: 25),

            //2. 이름 표시 부분
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Delivery address',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    AppFunctions.showBuilding(context);
                  },
                  child: const Text(
                    'CHANGE',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                ),
              ],
            ),

            //이름만 표시함
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.home_outlined),
                const SizedBox(width: 20),
                Text(
                  nameOnCard,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            //배달 방법 선택 부분
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Delivery Option',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    AppFunctions.showBuilding(context);
                  },
                  child: const Text(
                    'CHANGE',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // 배달 옵션 리스트 표시 영역
            _buildDeliveryOption(
              icon: Icons.directions_walk,
              title: "I’ll pick it up myself",
            ),
            const SizedBox(height: 15),

            _buildDeliveryOption(icon: Icons.two_wheeler, title: "By courier"),
            const SizedBox(height: 15),

            _buildDeliveryOption(
              icon: Icons.airplanemode_active, // 왜 드론 아이콘이 없는 것일까... 있으면 졸을텐데
              title: "By Drone",
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Non-contact-delivery Yes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                Switch(
                  value: contactDelivery,
                  onChanged: (value) {
                    setState(() {
                      contactDelivery = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 배달 옵션 개별 아이템 위젯 생성 커스텀 위젯
  Widget _buildDeliveryOption({required IconData icon, required String title}) {
    final isSelected = selectedOption == title;

    return InkWell(
      onTap: () {
        setState(() {
          selectedOption = title;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.deepPurpleAccent : Colors.grey,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.deepPurpleAccent : Colors.grey,
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check, color: Colors.deepPurpleAccent),
          ],
        ),
      ),
    );
  }
}
