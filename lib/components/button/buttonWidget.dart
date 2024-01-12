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
          decoration: BoxDecoration(
            color: true
                ? Colors.deepPurpleAccent
                : Colors.grey,
            borderRadius:
            BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                  true ? TodoTeamTitle : '신청이 마감되었습니다.',
                  style:
                  TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    );
  }

}