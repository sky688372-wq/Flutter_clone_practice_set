import 'package:clone_pr/function/app_functions.dart';
import 'package:flutter/material.dart';
import 'package:clone_pr/provider/credit_card_provider.dart';
import 'package:provider/provider.dart';

class CreditCardInfoScreen extends StatefulWidget {
  const CreditCardInfoScreen({super.key});

  @override
  State<CreditCardInfoScreen> createState() => _CreditCardInfoScreenState();
}

class _CreditCardInfoScreenState extends State<CreditCardInfoScreen> {
  @override
  Widget build(BuildContext context) {
    String cardNumber = context.watch<CreditCardProvider>().cardNumber;
    String nameOnCard = context.watch<CreditCardProvider>().nameOnCard;
    String expireDate = context.watch<CreditCardProvider>().expireDate;
    String cvc = context.watch<CreditCardProvider>().cvc;

    //텍스트 필드 컨트롤러들
    final TextEditingController _nameOnCardCtrl = TextEditingController(
      text: nameOnCard,
    );
    final TextEditingController _cardNumberCtrl = TextEditingController(
      text: cardNumber,
    );
    final TextEditingController _expirDataCtrl = TextEditingController(
      text: expireDate,
    );
    final TextEditingController _cvcCtrl = TextEditingController(text: cvc);

    return Scaffold(
      appBar: AppBar(), //화면 이전으로 돌아가기용 앱바

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Credit / Debit card',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 20),

              //2. 카드 영역
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blueAccent,
                      Colors.deepPurple.withValues(alpha: 0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 40,
                        child: Stack(
                          children: [
                            // 왼쪽 주황/빨강 원
                            Positioned(
                              left: 0,
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Colors.redAccent.withValues(
                                    alpha: 0.95,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Colors.amber.withValues(alpha: 0.8),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Center(
                        child: Text(
                          cardNumber.replaceAll(" ", "      "),
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(height: 65),

                      //이름과 기한 만료일
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              nameOnCard,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),

                            Text(
                              expireDate,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Center(
                child: IconButton(
                  onPressed: () {
                    AppFunctions.showBuilding(context);
                  },
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    size: 32,
                    color: Colors.grey,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // 이름 라벨 및 텍스트 필드
              const Text(
                'Name on card',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TextField(
                  controller: _nameOnCardCtrl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 0.1,
                        color: Colors.grey.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 카드 번호 라벨 및 텍스트 필드
              const Text(
                'Card number',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TextField(
                  controller: _cardNumberCtrl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 30,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: const BoxDecoration(
                                  color: Colors.redAccent,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: const BoxDecoration(
                                  color: Colors.amber,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 0.1,
                        color: Colors.grey.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 만료일 및 CVC 라인
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Expiry date',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 50,
                          child: TextField(
                            controller: _expirDataCtrl,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  width: 0.1,
                                  color: Colors.grey.withValues(alpha: 0.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'CVC',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 50,
                          child: TextField(
                            controller: _cvcCtrl,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: const Icon(
                                Icons.credit_card,
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  width: 0.1,
                                  color: Colors.grey.withValues(alpha: 0.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // 하단 카드 사용 버튼
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // 버튼 클릭 시에만 컨트롤러의 입력값들을 Provider에 최종 반영함
                    final cardProvider = context.read<CreditCardProvider>();
                    cardProvider.changeCardName(_nameOnCardCtrl.text, context);
                    cardProvider.changeCardNumber(
                      _cardNumberCtrl.text,
                      context,
                    );
                    cardProvider.changeExpireDate(_expirDataCtrl.text);
                    cardProvider.changeCvc(_cvcCtrl.text);

                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0ACF83),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'USE THIS CARD',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
