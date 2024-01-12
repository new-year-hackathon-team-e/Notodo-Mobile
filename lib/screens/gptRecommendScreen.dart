import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:notodo/common/layout/DefaultLayout.dart';

class gptRecommendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title:'Notodo AI',
      child: gptRecommendScreenState(),
    );
  }
}

class gptRecommendScreenState extends StatefulWidget {
  @override
  _gptRecommendScreenStateState createState() =>
      _gptRecommendScreenStateState();
}

class _gptRecommendScreenStateState extends State<gptRecommendScreenState>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  bool _showChatUI = false;
  late AnimationController _animationController;
  late Animation<double> _animation;
  late String showAnswer;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  Dio dio = Dio(); // Dio 인스턴스 생성

  void _toggleChatUI() async {
    var text = _controller.text;
    var url = 'http://203.234.29.12:8481/api/gpt';
    var data = {'usr_message': text};

    try {
      var response = await dio.post(url, data: data);

      if(response.statusCode == 200) {
        var serverResponse = response.data['result'];
        print('Server Response: $serverResponse');
        showAnswer = serverResponse;
        _animationController.forward();

      } else {
        print('Error: ${response.statusCode}');
      }

    } catch (e) {
      // 에러 처리
      print('Error sending request: $e');
    }

    setState(() {
      _showChatUI = !_showChatUI;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showChatUI ? _buildChatUI() : _buildInitialUI(),
    );
  }

  Widget _buildInitialUI() {
    return Column(
      children: <Widget>[
        SizedBox(height:160),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '2024년 당신이 이루고 싶은 NotToDo를 적어보세요!',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          'AI가 이루고 싶은 것들을 입력하면 NotToDo를 추천해줍니다!',
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3, left: 16.0, right: 16.0),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'ex) 담배 그만피고싶어요.'),
          ),
        ),
        GPTButton(title: 'AI한테 질문하기',onPressed: _toggleChatUI,),
      ],
    );
  }

  Widget _buildChatUI() {
    return FadeTransition(
      opacity: _animation,
      child: Center(
        child: Column(
          children: [
            SizedBox(height:200),
            Text('당신에게 추천된 방법이에요 😉\n ',style: TextStyle(fontSize:23,fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:10.0),
                  child: Container(decoration:BoxDecoration(color:Colors.grey, borderRadius: BorderRadius.circular(20),),child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${_controller.text}', style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                  )),
                ),
              ],
            ), //leflt
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:10.0,right:50.0,top: 10.0),
                  child: Container(decoration:BoxDecoration(color:Colors.blueAccent, borderRadius: BorderRadius.circular(20),),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(width:300,child: Text(showAnswer,softWrap: true,style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white))),
                    ),
                  ),
                ),
              ],
            ),//right
            Padding(
              padding: const EdgeInsets.only(top:15.0,left:15.0,right:15.0,bottom: 15.0,),
              child: GPTButton(title: 'NoToDo하러 가기',onPressed: (){print('test');},),
            )
          ],
        ),
      ),
    );
  }

}
class GPTButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  const GPTButton({Key? key, required this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent, // 배경 색상
            borderRadius: BorderRadius.circular(10), // 모서리 둥글게
          ),
          height: 40,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}