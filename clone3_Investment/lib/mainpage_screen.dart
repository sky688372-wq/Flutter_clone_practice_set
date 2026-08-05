import 'package:clone_pr/icon_model.dart';
import 'package:flutter/material.dart';

class MainpageScreen extends StatefulWidget {
  const MainpageScreen({super.key});

  @override
  State<MainpageScreen> createState() => _MainpageScreenState();
}

class _MainpageScreenState extends State<MainpageScreen> {
  List<Post> posts = [
    Post(
        name: "Basic type of investments",
        body: "This is how you set your foot for 2020 Stock market recession. What's next...",
        imgPath: "assets/images/tagan.jpg"),
    Post(
        name: "How much can you start wit..",
        body: "What do you like to see? It’s a very different market from 2018. The way...",
        imgPath: "assets/images/이안.jpeg")
  ];

  List<IconModel> list = [
    IconModel(
      icon: Icons.attach_money,
      payBack: "30% return",
      name: "Gold",
      color: Colors.yellow.shade700,
    ),
    IconModel(
        icon: Icons.euro,
        payBack: "60% return",
        name: "Silver",
        color: const Color(0xFF9EA3A8)),
    IconModel(
        icon: Icons.star_rate_outlined,
        payBack: "90% return",
        name: "Platinum",
        color: const Color(0xFF6B5BDE)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'Welcome, leeyeonjin.',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.green.withOpacity(0.8)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your, total assets portfolio',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'N203,935',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {},
                            child: const Text(
                              'Invest you',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    'Best Plans',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Text(
                          'See All',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.pinkAccent),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 13,
                          color: Colors.pinkAccent,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // 가로 스크롤 카드 영역
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final item = list[index];

                  return Container(
                    width: 140,
                    margin: const EdgeInsets.only(right: 12),
                    clipBehavior: Clip.hardEdge,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: item.color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.payBack,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          right: -30,
                          bottom: -20,
                          child: Icon(
                            item.icon,
                            size: 180,
                            color: Colors.black.withOpacity(0.12),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // Investment Guide 타이틀
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                "Investment Guide",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),

            // Post 리스트 구현 영역
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(), // 외부 스크롤 사용
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: posts.length,
              separatorBuilder: (context, index) => const Divider(
                height: 30,
                thickness: 1,
                color: Color(0xFFE0E0E0),
              ),
              itemBuilder: (context, index) {
                final post = posts[index];

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 좌측 텍스트 영역 (제목 & 본문)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF333333),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            post.body,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),

                    // 우측 원형 이미지 영역
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        post.imgPath,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}