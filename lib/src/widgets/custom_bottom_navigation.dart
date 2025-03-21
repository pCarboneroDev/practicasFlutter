import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.pink,
      //showSelectedLabels: false,
      //showUnselectedLabels: false,
      unselectedItemColor: Color.fromRGBO(116, 117, 152, 1),
      backgroundColor: Color.fromRGBO(55, 57, 84, 1),
      currentIndex: 1,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.circle),
          label: 'HOLA'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.graphic_eq),
          label: 'Sfx'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.verified_user_sharp),
          label: 'Security'
        )
      ],
    );
  }
}