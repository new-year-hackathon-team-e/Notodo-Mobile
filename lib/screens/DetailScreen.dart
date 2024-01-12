import 'package:flutter/material.dart';

import '../components/Card/CardWidget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return DetailScreenState();
  }
}

class DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // AppBar 배경을 투명하게 설정
        elevation: 0, // 그림자 제거
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new), // 뒤로 가기 아이콘
          onPressed: () {
            Navigator.pop(context); // 현재 화면을 pop하여 이전 화면으로 돌아감
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 300,
                    color: Colors.black,
                    child: const Center(
                        child: Text('🚬',
                            style: TextStyle(
                              fontSize: 30,
                            ))),
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 280),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '금연하기',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 6.0),
                                child:
                                    Text('금연하기 챌린지입니다. 하루에 식후땡을 자제 하시면 됩니다.'),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0, right: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('챌린지에 문제가 있어요!',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.underline,
                                      fontSize: 10)),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 20.0, right: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Team Ranking',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                    Flexible(child: Container()),
                                    IconButton(
                                      icon: const Icon(Icons.refresh_sharp),
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                                const SizedBox(height: 5),
                                const Column(
                                  children: [
                                    RankingCardWidget(
                                      rank: 1,
                                      nickname: '봉구스박보검',
                                      consecutiveDay: 5,
                                    ),
                                    RankingCardWidget(
                                      rank: 2,
                                      nickname: '롯데리아케찹도둑',
                                      consecutiveDay: 4,
                                    ),
                                    RankingCardWidget(
                                      rank: 3,
                                      nickname: '빚과송금',
                                      consecutiveDay: 2,
                                    ),
                                    RankingCardWidget(
                                      rank: 4,
                                      nickname: '모르는개산책',
                                      consecutiveDay: 1,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 70),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const applicationButton(),
    );
  }
}

class applicationButton extends StatelessWidget {
  const applicationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {
          print('닉네임');
        },
        child: Container(
          height: 50,
          decoration: const BoxDecoration(
            color:
                true ? Colors.deepPurpleAccent : Colors.grey, // 조건에 따라 배경색 변경
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(true ? '다짐 추가하기' : '신청이 마감되었습니다.',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    );
  }
}
