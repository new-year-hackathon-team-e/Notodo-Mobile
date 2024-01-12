import 'package:flutter/material.dart';
import 'package:notodo/common/data/colors.dart';

class ChannelSort extends StatelessWidget {
  final IconData icon;
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
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32.0,
            color: PRIMARY_COLOR,
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
