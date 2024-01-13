import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notodo/components/Button/ButtonWidget.dart';

class MoreScreen extends StatelessWidget {
  bool loginSession = true;

  MoreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyNoToDo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              print('Notifications pressed');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            loginSession ? const AfterLogin() : const BeforeLogin(),
            Container(height: 8, color: Colors.black12),
            const MoreScreenButton(
              functionName: '기능추가요청',
            ),
            const MoreScreenButton(
              functionName: '친구초대',
            ),
            const MoreScreenButton(
              functionName: '공지/이벤트',
            ),
            const MoreScreenButton(
              functionName: '1:1문의',
            ),
            const MoreScreenButton(
              functionName: 'NoToDO정보',
            ),
          ],
        ),
      ),
    );
  }
}

class BeforeLogin extends StatelessWidget {
  const BeforeLogin({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('로그인이 필요해요.',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Text('NoToDo를 통해 신년 계획을 세워보세요!'),
          applicationButton(
              TodoTeamTitle: '로그인하기',
              onPressed: () {
                print('test');
              }),
        ],
      ),
    );
  }
}

class AfterLogin extends StatelessWidget {
  const AfterLogin({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        height: 165,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image.network(
                      'https://tistory1.daumcdn.net/tistory/4190504/attach/73253243e52e40c281dcf4a115090293',
                      width: 80.0, // 원하는 너비
                      height: 80.0, // 원하는 높이
                      fit: BoxFit.cover, // 이미지가 둥근 영역에 맞게 조절
                    ),
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'test',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            applicationButton(
                TodoTeamTitle: '프로필 수정하기',
                onPressed: () {
                  print('test');
                }),
          ],
        ),
      ),
    );
  }
}

class MoreScreenButton extends StatelessWidget {
  final String functionName;
  final void onPressed;

  const MoreScreenButton(
      {super.key, required this.functionName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: InkWell(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 12.0),
                child: Text(functionName),
              ),
              Container(height: 1, color: Colors.black12),
            ],
          ),
        ),
      ),
    );
  }
}
