import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notodo/common/data/colors.dart';
import 'package:notodo/common/layout/DefaultLayout.dart';
import 'package:notodo/components/Card/CardWidget.dart';
import 'package:notodo/provider/MyTodoListProvider.dart';

// 시간을 관리하는 riverpod
final timeProvider = StateProvider<TimeOfDay>((ref) {
  return TimeOfDay.now();
});

class MytodoListScreen extends ConsumerStatefulWidget {
  const MytodoListScreen({super.key});

  @override
  ConsumerState<MytodoListScreen> createState() => _MytodoListScreenState();
}

class _MytodoListScreenState extends ConsumerState<MytodoListScreen> {
  @override
  Widget build(BuildContext context) {
    final List<MyTodoCard> myTodoCardList = ref.watch(myTodoCardProvider);
    final TextEditingController todoController = TextEditingController();
    TimeOfDay initialTime = ref.watch(timeProvider);
    Dio dio = Dio();
    return DefaultLayout(
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: IconButton(
            onPressed: () {
              // Add 버튼을 눌렀을 때 다이얼로그 표시
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // 다이얼로그 UI를 반환
                  return AlertDialog(
                    title: const Text('새로운 NoTodo 추가'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: todoController,
                          decoration: const InputDecoration(
                            hintText: '하지 않을 일을 입력하세요',
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final TimeOfDay? timeOfDay = await showTimePicker(
                              context: context,
                              initialTime: initialTime,
                            );
                            if (timeOfDay != null) {
                              ref.read(timeProvider.notifier).state = timeOfDay;
                            }
                          },
                          child: const Text('알람을 받을 시간을 선택하세요'),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // 다이얼로그 닫기
                        },
                        child: const Text('취소'),
                      ),
                      TextButton(
                        onPressed: () {
                          ref.read(myTodoCardProvider.notifier).addMyTodoCard(
                                content: todoController.text,
                                time:
                                    '${initialTime.hour}:${initialTime.minute}',
                              );
                          Navigator.of(context).pop();
                        },
                        child: const Text('추가'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ),
      ],
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
