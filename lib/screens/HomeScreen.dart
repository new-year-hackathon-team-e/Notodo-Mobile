import 'dart:math';

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
      title: 'NoTodo',
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: '검색',
                suffix: GestureDetector(
                  onTap: () {
                    print('search');
                  },
                  child: const Icon(
                    Icons.search,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    16.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                crossAxisSpacing: 16.0,
                children: const [
                  ChannelSort(
                    icon: Icons.health_and_safety_outlined,
                    label: '건강',
                  ),
                  ChannelSort(
                    icon: Icons.school_outlined,
                    label: '교육',
                  ),
                  ChannelSort(
                    icon: Icons.attach_money_outlined,
                    label: '경제',
                  ),
                  ChannelSort(
                    icon: Icons.forest_outlined,
                    label: '환경',
                  ),
                ],
              ),
            ),
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
                            height: 16.0,
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
                            iconText: '',
                            backgroundColor: Colors.amber,
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
        ),
      ),
    );
  }
}
