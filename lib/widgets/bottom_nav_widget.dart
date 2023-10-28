import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          backgroundColor: Color.fromRGBO(27, 26, 46, 1),
          icon: Icon(Icons.home, color: Colors.grey),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          backgroundColor: Color.fromRGBO(27, 26, 46, 1),
          icon: Icon(Icons.currency_exchange, color: Colors.grey),
          label: 'Câmbio',
        ),
        BottomNavigationBarItem(
          backgroundColor: Color.fromRGBO(27, 26, 46, 1),
          icon: Icon(Icons.query_stats, color: Colors.grey),
          label: 'Índices',
        ),
        BottomNavigationBarItem(
          backgroundColor: Color.fromRGBO(27, 26, 46, 1),
          icon: Icon(Icons.business, color: Colors.grey),
          label: 'Ações',
        ),
      ],
    );
  }
}
