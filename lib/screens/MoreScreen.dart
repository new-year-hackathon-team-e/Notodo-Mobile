import 'package:flutter/material.dart';
import 'package:notodo/common/layout/DefaultLayout.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      child: Center(
        child: Text('more'),
      ),
    );
  }
}
