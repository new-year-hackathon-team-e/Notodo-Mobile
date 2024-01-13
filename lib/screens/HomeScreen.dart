import 'package:flutter/material.dart';
import 'package:notodo/common/layout/DefaultLayout.dart';
import 'package:notodo/components/Card/CardWidget.dart';
import 'package:notodo/components/Sort/ChannelSort.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<String> future = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ),
      ],
      title: 'NoTodo',
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 240,
                width: 500,
                child: Expanded(
                    child: Image.asset('assets/imgages/banner.png',
                        fit: BoxFit.fill))),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.black12, width: 2.0),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: '어떤 NoToDo를 찾고 계신가요?',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.search_rounded),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 13.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7.5, right: 7.5),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  crossAxisSpacing: 16.0,
                  children: const [
                    ChannelSort(
                      icon: 'assets/imgages/health.png',
                      label: '건강',
                    ),
                    ChannelSort(
                      icon: 'assets/imgages/education.png',
                      label: '교육',
                    ),
                    ChannelSort(
                      icon: 'assets/imgages/economy.png',
                      label: '경제',
                    ),
                    ChannelSort(
                      icon: 'assets/imgages/forest.png',
                      label: '환경',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            FutureBuilder(
              future: future,
              builder: ((context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox(
                    // height: MediaQuery.of(context).size.height * 0.5,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 19.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('OO님 이 Team 어때요?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25)),
                          TodoCardHorizontal(
                            TodoTeamTitle: '다이어트 멤버 구해요!',
                            TodoTeamJoinMember: '17',
                            TodoTeamTotalMember: '25',
                            iconText: '🐷',
                            backgroundColor: Colors.grey,
                            TodoTeamCategory: '건강',
                          ),
                          InkWell(
                            child: TodoCardHorizontal(
                              TodoTeamTitle: '플러터랑 플러팅 할사람',
                              TodoTeamJoinMember: '3',
                              TodoTeamTotalMember: '5',
                              iconText: '👨‍💻',
                              backgroundColor: Colors.blue,
                              TodoTeamCategory: '교육',
                            ),
                          ),
                          TodoCardHorizontal(
                            TodoTeamTitle: '오늘부터 금연할사람',
                            TodoTeamJoinMember: '68',
                            TodoTeamTotalMember: '100',
                            iconText: '🚬',
                            backgroundColor: Colors.black,
                            TodoTeamCategory: '건강',
                          ),
                          TodoCardHorizontal(
                            TodoTeamTitle: '거지방',
                            TodoTeamJoinMember: '25',
                            TodoTeamTotalMember: '50',
                            iconText: '💸',
                            backgroundColor: Colors.yellow,
                            TodoTeamCategory: '경제',
                          ),
                        ],
                      ), // child: ListView.builder(
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   itemCount: 3,
                      //   itemBuilder: (context, index) {
                      //     final pItem = snapshot.data![index];
                      //     return GestureDetector(
                      //       onTap: () {},
                      //       child: const TodoCardHorizontal(
                      //         TodoTeamTitle: '금연방',
                      //         TodoTeamJoinMember: '3',
                      //         TodoTeamTotalMember: '5',
                      //         iconText: '',
                      //         backgroundColor: Colors.amber,
                      //         TodoTeamCategory: '건강',
                      //       ),
                      //     );
                      //   },
                      // ),
                    ),
                  );
                }
              }),
            ),
            const SizedBox(
              height: 30.0,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 5),
              child: Text('현재 HOT핫 Team🔥',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            ),

            Container(
              height: 280,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TodoCardVertical(
                          TodoTeamTitle: '다이어트 멤버 구해요!',
                          TodoTeamJoinMember: '17',
                          TodoTeamTotalMember: '25',
                          iconText: '🐷',
                          backgroundColor: Colors.grey,
                          TodoTeamCategoroy: '건강',
                        ),
                        TodoCardVertical(
                          TodoTeamTitle: '플러터랑 플러팅 할사람',
                          TodoTeamJoinMember: '3',
                          TodoTeamTotalMember: '5',
                          iconText: '👨‍💻',
                          backgroundColor: Colors.blue,
                          TodoTeamCategoroy: '교육',
                        ),
                        TodoCardVertical(
                          TodoTeamTitle: '오늘부터 금연할사람',
                          TodoTeamJoinMember: '68',
                          TodoTeamTotalMember: '100',
                          iconText: '🚬',
                          backgroundColor: Colors.black,
                          TodoTeamCategoroy: '건강',
                        ),
                        TodoCardVertical(
                          TodoTeamTitle: '거지방',
                          TodoTeamJoinMember: '25',
                          TodoTeamTotalMember: '50',
                          iconText: '💸',
                          backgroundColor: Colors.yellow,
                          TodoTeamCategoroy: '건강',
                        ),
                      ],
                    ),
                  )),
            ),
            SizedBox(height: 20),
            // FutureBuilder(
            //   future: future,
            //   builder: ((context, snapshot) {
            //     if (!snapshot.hasData) {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     } else {
            //       return SizedBox(
            //         height: MediaQuery.of(context).size.height * 0.388,
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //           child: ListView.builder(
            //             scrollDirection: Axis.horizontal,
            //             itemCount: 3,
            //             itemBuilder: (context, index) {
            //               final pItem = snapshot.data![index];
            //               return GestureDetector(
            //                 onTap: () {},
            //                 child: const TodoCardVertical(
            //                   TodoTeamTitle: '다이어트방',
            //                   TodoTeamJoinMember: '3',
            //                   TodoTeamTotalMember: '5',
            //                   iconText: '',
            //                   backgroundColor: Colors.blue,
            //                   TodoTeamCategoroy: '건강',
            //                 ),
            //               );
            //             },
            //           ),
            //         ),
            //       );
            //     }
            //   }),
            // ),
          ],
        ),
      ),
    );
  }
}
