import 'package:flutter/material.dart';

class applicationButton extends StatelessWidget{
  final String TodoTeamTitle;
  final void onPressed;

  const applicationButton({super.key, required this.TodoTeamTitle,required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {
          onPressed;
        },
        child: Container(
          height:50,
          decoration: BoxDecoration(
            color: true
                ? Colors.deepPurpleAccent
                : Colors.grey, // 조건에 따라 배경색 변경
            borderRadius:
            BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                  true ? '다짐 추가하기' : '신청이 마감되었습니다.',
                  style:
                  TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    );
  }

}