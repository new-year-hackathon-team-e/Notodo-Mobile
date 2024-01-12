import 'package:flutter/material.dart';
import 'package:notodo/common/layout/DefaultLayout.dart';
import 'package:notodo/components/Card/CardWidget.dart';

import '../components/Card/CardWidget.dart';

class TeamTodoListScreen extends StatefulWidget {
  const TeamTodoListScreen({super.key});

  @override
  State<TeamTodoListScreen> createState() => _TeamTodoListScreenState();
}

class _TeamTodoListScreenState extends State<TeamTodoListScreen> {
  Future<String> future = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Team 신청 리스트',
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
                          TodoTeamCategory: '건강',
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
