import 'package:flutter/material.dart';
import 'package:notodo/common/layout/DefaultLayout.dart';

class TeamRecruitScreen extends StatelessWidget {
  final title_field = TextEditingController();
  final explain_field = TextEditingController();
  final rules_field = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '팀원 모집글 작성',
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(titleName: '제목',),
          ],
        ),
      ),
    );
  }
}

class InputfieldWidget extends StatelessWidget{
  final TextEditingController controller;

  const InputfieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.blue,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
      controller: controller,
    );
  }

}
class TitleWidget extends StatelessWidget{
  final String titleName;

  const TitleWidget({super.key, required this.titleName});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(bottom:8.0),
      child: Text(titleName,style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
    );
  }


}