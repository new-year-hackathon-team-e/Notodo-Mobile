import 'package:flutter/material.dart';
import 'package:notodo/common/data/colors.dart';
import 'package:notodo/common/layout/DefaultLayout.dart';

class MyTodoCreateScreeen extends StatefulWidget {
  const MyTodoCreateScreeen({super.key});

  @override
  State<MyTodoCreateScreeen> createState() => _MyTodoCreateScreeenState();
}

class _MyTodoCreateScreeenState extends State<MyTodoCreateScreeen> {
  String? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'TimePicker',
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                hintText: '하지 않을 일을 입력하세요',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () {
                Future<TimeOfDay?> selectedTime = showTimePicker(
                  context:
                      context, // context 는 Future 타입으로 TimeOfDay 타입의 값을 반환 합니다
                  initialTime: TimeOfDay.now(), // 프로퍼티에 초깃값을 지정합니다.
                );
                selectedTime.then((value) {
                  setState(() {
                    _selectedTime = '${value?.hour} : ${value?.minute}';
                  });
                });
              },
              child: const Text('Time Picker'),
            ),
            Text(_selectedTime ?? ''),
          ],
        ),
      ),
    );
  }
}
