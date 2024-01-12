import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notodo/components/Button/ButtonWidget.dart';

class MoreScreen extends StatelessWidget {
  bool loginSession = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MyNoToDo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none),
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
            loginSession ? AfterLogin() : BeforeLogin(),
            Container(height:8,color:Colors.black12),
            MoreScreenButton(functionName: '기능추가요청',),
            MoreScreenButton(functionName: '친구초대',),
            MoreScreenButton(functionName: '공지/이벤트',),
            MoreScreenButton(functionName: '1:1문의',),
            MoreScreenButton(functionName: 'NoToDO정보',),
          ],
        ),
      ),
    );
  }
}

class BeforeLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('로그인이 필요해요.',style: TextStyle(fontWeight: FontWeight.bold)),
          Text('NoToDo를 통해 신년 계획을 세워보세요!'),
          applicationButton(TodoTeamTitle: '로그인하기', onPressed: (){print('test');}),
        ],
      ),
    );
  }

}

class AfterLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: Container(
        height: 165,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20.0,right:20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVq6nmQ8ESCDv4KMuOdHvXHdJwYssLcKNzh9ruU9WFAw&s',
                      width: 80.0,  // 원하는 너비
                      height: 80.0, // 원하는 높이
                      fit: BoxFit.cover, // 이미지가 둥근 영역에 맞게 조절
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:20.0),
                        child: Text('test',style: TextStyle(fontSize: 20.0),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            applicationButton(TodoTeamTitle: '프로필 수정하기', onPressed: (){print('test');}),

          ],
        ),
      ),
    );
  }

}

class MoreScreenButton extends StatelessWidget{
  final String functionName;
  final void onPressed;

  const MoreScreenButton({super.key, required this.functionName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20.0,right:20.0),
      child: InkWell(
        child:Container(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:15.0,bottom:12.0),
                child: Text(functionName),
              ),
              Container(height:1.5, color:Colors.black12),
            ],
          ),
        ),
      ),
    );
  }

}