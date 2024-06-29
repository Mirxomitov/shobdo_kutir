import 'package:flutter/material.dart';

Widget buildBottomNavigationItem(
  IconData icon,
  String label,
  int index,
  void Function(int index) onItemTapped,
  int selectedIndex,
) {
  return GestureDetector(
    onTap: () => onItemTapped(index),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 32,
          color: selectedIndex == index ? Colors.red : Colors.grey,
        ),
        Text(
          label,
          style: TextStyle(
            color: selectedIndex == index ? Colors.red : Colors.grey,
          ),
        ),
      ],
    ),
  );
}
