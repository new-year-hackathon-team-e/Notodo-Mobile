import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:notodo/common/layout/DefaultLayout.dart';

import '../components/button/buttonWidget.dart';

class teamRecruitScreen extends StatefulWidget {
  @override
  _teamRecruitScreenState createState() => _teamRecruitScreenState();
}

class _teamRecruitScreenState extends State<teamRecruitScreen> {
  String iconString = '😒';
  Color _color = Colors.blue;
  final titleFieldController = TextEditingController();
  final explainFieldController = TextEditingController();
  final iconController = TextEditingController();
  final rulesFieldController = TextEditingController();

  void _updateIconString(String newIcon) {
    setState(() {
      iconString = newIcon;
    });
  }

  void _printValues() {
    print('색상: ${_color.toString()}');
    print('아이콘: $iconString');
    print('제목: ${titleFieldController.text}');
    print('내용: ${explainFieldController.text}');
  }

  void _openColorPicker() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('색상 선택'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                // 아이콘 표시
                Center(
                  child: Text(
                    iconString, // 사용자가 입력한 아이콘 문자열 사용
                    style: TextStyle(
                      fontSize: 50, // 아이콘 크기 조정
                      color: _color, // 선택된 색상으로 색상 지정
                    ),
                  ),
                ),
                ColorPicker(
                  pickerColor: _color,
                  onColorChanged: (Color color) {
                    setState(() {
                      _color = color;
                    });
                  },
                  pickerAreaHeightPercent: 0.8,
                  enableAlpha: true,
                  paletteType: PaletteType.hsvWithHue,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: '아이콘 입력 (예: 😂)',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: _updateIconString,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('완료'),
              onPressed: () {
                Navigator.of(context).pop(); // 대화상자 닫기
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '팀원 모집글 작성',
      child: SingleChildScrollView(
        child: Column(
          children: [
            IconBgDisplay(
              selectedColor: _color,
              iconString: iconString,
            ),
            Container(
              color: Colors.black12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        child: SizedBox(height: 20, child: Text('배경만들기')),
                        onTap: _openColorPicker,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  TitleWidget(titleName: '제목'), // 색상 추가
                  InputFieldWidget(
                      controller: titleFieldController, contentHeight: 70.0),
                  SizedBox(height: 20),
                  TitleWidget(titleName: '내용'),
                  InputFieldWidget(
                      controller: explainFieldController, contentHeight: 140.0),
                  SizedBox(height: 40),

                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: InkWell(
                      onTap: _printValues,
                      child: Center(
                          child: Text('팀 신청하기',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final double contentHeight;

  const InputFieldWidget(
      {super.key, required this.controller, required this.contentHeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: contentHeight,
      child: TextField(
        expands: true,
        maxLines: null,
        textAlign: TextAlign.start,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        controller: controller,
      ),
    );
  }
}

class IconBgDisplay extends StatelessWidget {
  final Color selectedColor;
  final String iconString;

  const IconBgDisplay(
      {Key? key, required this.selectedColor, required this.iconString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          color: selectedColor,
          width: double.infinity,
          child: Center(
            child: Text(iconString,
                style: TextStyle(
                  fontSize: 50,
                )),
          ),
        ),
      ],
    );
  }
}

class TitleWidget extends StatelessWidget {
  final String titleName;
  final Color iconColor;

  const TitleWidget(
      {Key? key, required this.titleName, this.iconColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(titleName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}