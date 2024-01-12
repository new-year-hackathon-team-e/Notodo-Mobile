import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notodo/common/data/colors.dart';
import 'package:notodo/common/layout/DefaultLayout.dart';
import 'package:notodo/provider/MyTodoListProvider.dart';

class MytodoListScreen extends ConsumerWidget {
  const MytodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Dio dio = Dio();
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: ref
                    .watch(myTodoCardProvider)
                    .map(
                      (e) => CheckboxListTile(
                        title: Text(e.content),
                        subtitle: Text(e.time),
                        value: e.hasDone,
                        onChanged: (value) {
                          ref.read(myTodoCardProvider.notifier).toggleHasDone(
                                content: e.content,
                              );
                          // 서버에 요청
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
