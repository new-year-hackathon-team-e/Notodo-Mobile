import 'package:flutter/material.dart';
import 'package:notodo/common/layout/DefaultLayout.dart';
import 'package:notodo/screens/TeamRecruitScreen.dart';

import '../common/data/colors.dart';
import '../components/Card/CardWidget.dart';

class detailCategoryListScreen extends StatefulWidget {
  const detailCategoryListScreen({super.key});

  @override
  State<detailCategoryListScreen> createState() => _detailCategoryListScreenState();
}

class _detailCategoryListScreenState extends State<detailCategoryListScreen> {

  Future<String> future = Future<String>.delayed(
    const Duration(seconds: 2),
        () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '건강 '+'카테고리',
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        tooltip: '팀원 모집하기',
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => teamRecruitScreen())); },
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
      child: Center(child: Column(
        children: [
          FutureBuilder(
            future: future,
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: ((context, index) => const SizedBox(
                      height: 5.0,
                    )),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      final pItem = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {},
                        child: const TodoCardHorizontal(
                          TodoTeamTitle: '금연방',
                          TodoTeamJoinMember: '3',
                          TodoTeamTotalMember: '5',
                          iconText: '🚬',
                          backgroundColor: Colors.grey,
                          TodoTeamCategoroy: '건강',
                        ),
                      );
                    },
                  ),
                );
              }
            }),
          ),
        ],
      )),
    );
  }
}