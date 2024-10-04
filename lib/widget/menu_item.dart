import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  MenuItem({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favoritos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'Créditos',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: const Color.fromARGB(255, 202, 94, 73),
      unselectedItemColor: const Color.fromARGB(255, 180, 153, 153),
      onTap: onItemTapped,
    );
  }
}
