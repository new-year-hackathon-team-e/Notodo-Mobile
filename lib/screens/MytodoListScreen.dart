import 'package:flutter/material.dart';
import 'package:notodo/common/data/colors.dart';
import 'package:notodo/common/layout/DefaultLayout.dart';
import 'package:notodo/components/Card/CardWidget.dart';

class MytodoListScreen extends StatelessWidget {
  const MytodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        tooltip: 'AI에게 추천받기',
        onPressed: () {},
        child: const Icon(
          Icons.smart_toy_outlined,
          color: Colors.white,
        ),
      ),
      title: 'My Todo List',
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: Future<String>.delayed(
                  const Duration(seconds: 2),
                  () => 'Data Loaded',
                ),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.separated(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container();
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
