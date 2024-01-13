import 'package:flutter/material.dart';
import 'package:notodo/common/data/colors.dart';
import 'package:notodo/screens/detailCategoryListScreen.dart';

class ChannelSort extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback? onTap;

  const ChannelSort({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailCategoryListScreen()),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width:50,
            height:50,
            child: Image.asset(
              icon,
              fit: BoxFit.fill, // 이미지를 콘테이너에 꽉 채우도록 설정
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              fontFamily: 'Pretendard',
            ),
          ),
        ],
      ),
    );
  }
}
