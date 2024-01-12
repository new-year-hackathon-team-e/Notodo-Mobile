import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notodo/screens/HomeScreen.dart';
import 'package:notodo/screens/MoreScreen.dart';
import 'package:notodo/screens/MytodoListScreen.dart';
import 'package:notodo/screens/TeamTodoListScreen.dart';
import 'package:notodo/screens/detailCategoryListScreen.dart';
import 'package:notodo/screens/teamRecruitScreen.dart';

import '../components/NavigationBar/bottomNavigationBar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

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
      const HomeScreen(),
      detailCategoryListScreen(),
      const MytodoListScreen(),
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
    WidgetsFlutterBinding.ensureInitialized();
    return ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Pretendard',
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          bottomNavigationBar:
              mainBottomNavigationBar(_selectedIndex, _onItemTapped),
          body: SafeArea(
            child: IndexedStack(
              index: _selectedIndex,
              children: _screens,
            ),
          ),
        ),
      ),
    );
  }
}
