import 'package:flutter/material.dart';
import 'package:notodo/common/layout/DefaultLayout.dart';

class TeamTodoLIstScreen extends StatelessWidget {
  const TeamTodoLIstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      child: Center(
        child: Text('team'),
      ),
    );
  }
}
