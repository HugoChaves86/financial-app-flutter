import '../pages/about_page.dart';
import '../pages/help_page.dart';
import 'package:flutter/material.dart';
import '../models/mypopup_menu.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({super.key});

  void _selectOption(BuildContext context, String choice) {
    switch (choice) {
      case MyPopupMenu.help:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HelpPage()),
        );
        break;
      case MyPopupMenu.about:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AboutPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (choice) => _selectOption(context, choice),
      itemBuilder: (BuildContext context) {
        return MyPopupMenu.choices.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }
}
