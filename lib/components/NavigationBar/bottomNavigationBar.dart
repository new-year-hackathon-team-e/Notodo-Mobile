import 'package:flutter/material.dart';

BottomNavigationBar mainBottomNavigationBar(_selectedIndex,_onItemTapped){
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: _selectedIndex,
    onTap: _onItemTapped,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.people_alt),
        label: 'Team Todo',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_month_rounded),
        label: 'My Todo',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.more_horiz_sharp),
        label: 'More',
      ),
    ],
  );
}