import 'package:flutter/material.dart';
import 'package:notodo/common/data/colors.dart';

BottomNavigationBar mainBottomNavigationBar(selectedIndex, onItemTapped) {
  return BottomNavigationBar(
    selectedLabelStyle: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
    selectedItemColor: PRIMARY_COLOR,
    type: BottomNavigationBarType.fixed,
    currentIndex: selectedIndex,
    onTap: onItemTapped,
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
