import 'package:flutter/material.dart';
import 'package:notodo/common/layout/DefaultLayout.dart';
import 'package:notodo/screens/TeamRecruitScreen.dart';

import '../common/data/colors.dart';
import '../components/Card/CardWidget.dart';

class DetailCategoryListScreen extends StatefulWidget {
  const DetailCategoryListScreen({super.key});

  @override
  State<DetailCategoryListScreen> createState() =>
      _DetailCategoryListScreenState();
}

class _DetailCategoryListScreenState extends State<DetailCategoryListScreen> {
  Future<String> future = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '건강 ' '카테고리',
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        tooltip: '팀원 모집하기',
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => teamRecruitScreen()));
        },
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
      child: Center(
          child: Column(
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
                  child: Column(
                    children: [
                      TodoCardHorizontal(
                        TodoTeamTitle: '금연해요',
                        TodoTeamJoinMember: '3',
                        TodoTeamTotalMember: '5',
                        iconText: '🚬',
                        backgroundColor: Colors.grey,
                        TodoTeamCategory: '건강',
                      ),
                      TodoCardHorizontal(
                        TodoTeamTitle: '금주방',
                        TodoTeamJoinMember: '3',
                        TodoTeamTotalMember: '10',
                        iconText: '🍺',
                        backgroundColor: Colors.grey,
                        TodoTeamCategory: '건강',
                      ),TodoCardHorizontal(
                        TodoTeamTitle: '식단 관리방',
                        TodoTeamJoinMember: '20',
                        TodoTeamTotalMember: '50',
                        iconText: '🫘',
                        backgroundColor: Colors.grey,
                        TodoTeamCategory: '건강',
                      ),

                    ],
                  )
                );
              }
            }),
          ),
        ],
      )),
    );
  }
}
