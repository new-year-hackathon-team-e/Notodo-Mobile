// StateNotifierProvider를 선언할 때는 클래스를 선언해야함
// StateNotifier를 상속해야함
// 상태관리할 타입이 어떤 건지 지정해줘야함
// 클래스이기 떄문에 메소드로 상태 관리 가능
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notodo/components/Card/CardWidget.dart';

// 첫 번째 제네릭으로 어떤 노티파이어를 사용할건지
// 두 번째 제네릭으로 관리하는 상태의 타입을 넣기
final myTodoCardProvider =
    StateNotifierProvider<MyTodoCardNotifier, List<MyTodoCard>>(
  (ref) => MyTodoCardNotifier(),
);

class MyTodoCardNotifier extends StateNotifier<List<MyTodoCard>> {
  MyTodoCardNotifier()
      : super(
          [
            const MyTodoCard(
              content: "금연하기",
              time: "12:30",
              hasDone: true,
            ),
            const MyTodoCard(
              content: "야식 먹지 않기",
              time: "22:30",
              hasDone: true,
            ),
            const MyTodoCard(
              content: "스타벅스 그만 가기",
              time: "10:30",
              hasDone: false,
            ),
          ],
        );

  void toggleHasDone({required String content}) {
    // 현재 값을 가져오고 싶으면 state 호출
    state = state
        .map((e) => e.content == content
            ? MyTodoCard(
                content: e.content,
                time: e.time,
                hasDone: !e.hasDone,
              )
            : e)
        .toList();
  }

  void addMyTodoCard({required String content, required String time}) {
    state = [
      ...state,
      MyTodoCard(
        content: content,
        time: time,
        hasDone: false,
      ),
    ];
  }

  void removeMyTodoCard({required String content}) {
    state = state.where((e) => e.content != content).toList();
  }
}
