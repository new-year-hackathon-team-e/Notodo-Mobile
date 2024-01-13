import 'package:flutter/material.dart';

import '../components/button/buttonWidget.dart';
import '../components/Card/CardWidget.dart';

class DetailScreen extends StatefulWidget {
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
          icon: Icon(Icons.arrow_back_ios_new), // 뒤로 가기 아이콘
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
                    child: Center(
                        child: Text('🚬',
                            style: TextStyle(
                              fontSize: 30,
                            ))),
                  ),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.only(top: 280),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '오늘부터 금연할사람',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Text('금연하기 챌린지입니다. 하루에 식후땡을 자제 하시면 됩니다.'),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 20.0),
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Team Ranking',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                    Flexible(child: Container()),
                                    IconButton(icon:Icon(Icons.refresh_sharp), onPressed: () {  },)
                                  ],
                                ),
                                SizedBox(height: 5),
                                Column(
                                    children: [
                                      RankingCardWidget(
                                        rank:1,
                                        nickname: '봉구스박보검',
                                        consecutiveDay: 5,
                                      ),
                                      RankingCardWidget(
                                        rank:2,
                                        nickname: '롯데리아케찹도둑',
                                        consecutiveDay: 4,
                                      ),
                                      RankingCardWidget(
                                        rank:3,
                                        nickname: '빚과송금',
                                        consecutiveDay: 2,
                                      ),
                                      RankingCardWidget(
                                        rank:4,
                                        nickname: '모르는개산책',
                                        consecutiveDay: 1,
                                      ),
                                    ],
                                  ),
                                SizedBox(height:70),
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

      bottomNavigationBar: applicationButton(TodoTeamTitle: '다짐 신청하기', onPressed: (){print('test');},),
    );
  }
}

