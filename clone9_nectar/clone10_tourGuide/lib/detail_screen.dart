import 'package:clone_pr3/model_class.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.imgPath,
    required this.name,
    required this.isFavorite,
  });

  final String imgPath;
  final String name;
  final bool isFavorite;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {


  //여행 정보 리스트
  List<TravelInfo> travelInfo = [
    TravelInfo(text: "from 90 \$",
        icon: Icons.credit_card_outlined,
        iconColor: Colors.blue),
    TravelInfo(
        text: "Car", icon: Icons.car_crash, iconColor: Colors.orangeAccent),
    TravelInfo(
        text: "Full board", icon: Icons.restaurant, iconColor: Colors.green),
    TravelInfo(text: "Insurance",
        icon: Icons.health_and_safety,
        iconColor: Colors.lightBlueAccent.withValues(alpha: 0.8)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //1. 상단 사진
                Container(
                  width: double.infinity,
                  height: 400,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(widget.imgPath, fit: BoxFit.cover),
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Container(
                            width: 40,
                            height: 40,

                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)
                            ),
                            child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                      Icons.arrow_back_ios_new
                                  )
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 20),

                //2. 장소 이름
                Text(
                  widget.name.replaceAll("\n", " "),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 10),

                //3.설명
                Text(
                  '''나는 너무 코딩이 하고 싶다. 어떻게 자습이 3시간밖에 없을 수 있나..
                솔직히 기숙사에서도 노트북으로 면학 때 항시 가능하도록 하면 좋겠다.
                왜 코딩을 할 수 있는 시간은 이렇게 적은 거지? 방학이 되면 하루 10시간 이상씩
                코딩을 하고 싶다. 추석에는 뭘 만들지 고민도 되고 왜이리 코딩할 시간이 왜이지도 없는지 모르겠다'''
                      .replaceAll('\n', '')
                      .replaceAll(RegExp(r'\s+'), ' '),
                ),

                const SizedBox(height: 10,),

                //4. read more
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Read more',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.pinkAccent
                      ),
                    ),

                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.pinkAccent,
                    )
                  ],
                ),

                const SizedBox(height: 10,),

                // 4. 여행 정보 컨테이너
                SizedBox(
                  width: double.infinity,
                  height: 110,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: travelInfo.length,
                    itemBuilder: (context, index) {
                      final item = travelInfo[index];

                      return TravelInfo.buildTravelInfo(
                          text: item.text,
                          icon: item.icon,
                          iconColor: item.iconColor
                      );
                    },
                  ),
                ),

                SizedBox(height: 20,),

                //5. 투어 구매 버튼
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 70),
                    backgroundColor: Colors.pinkAccent
                  ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.blue,
                          content: Text(
                            "지금은 오후 12시 ~ 이제 기숙사로 갑니다.",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                            ),
                          ),
                        )
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Buy a tour',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        )
                      ],
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
