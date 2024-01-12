import 'package:flutter/material.dart';
import 'package:notodo/screens/HomeScreen.dart';
import 'package:notodo/screens/MoreScreen.dart';
import 'package:notodo/screens/MytodoListScreen.dart';
import 'package:notodo/screens/TeamTodoListScreen.dart';

import '../components/NavigationBar/bottomNavigationBar.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();

  int _selectedIndex = 0;

  late Function(int) _updateSelectedIndex;

  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _updateSelectedIndex = (index) {
      setState(() {
        _selectedIndex = index;
      });
    };

    _screens.addAll([
      HomeScreen(),
      TeamTodoLIstScreen(),
      MytodoListScreen(),
      MoreScreen(),
    ]);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: mainBottomNavigationBar(_selectedIndex,_onItemTapped),
        body: SafeArea(
          child: IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),
        ),
      ),
    );
  }
}

