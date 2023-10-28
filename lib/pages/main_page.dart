import 'package:atividade_flutter/pages/home_page.dart';
import 'package:atividade_flutter/pages/index_page.dart';
import 'package:atividade_flutter/pages/stocks_page.dart';
import 'package:flutter/material.dart';
import 'package:atividade_flutter/pages/currency_page.dart';
import '../widgets/pop_up_menu.dart';

import '../widgets/bottom_nav_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  String title = "Home";

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;

      switch (_currentIndex) {
        case 0:
          title = "Home";
        case 1:
          title = "Câmbio";
        case 2:
          title = "Taxas e índices";
        case 3:
          title = "Ações";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(27, 26, 46, 1),
          actions: const [PopupMenu()],
          centerTitle: true,
          title: Text(title),
          automaticallyImplyLeading: false,
        ),
        body: _buildBody(),
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const CurrencyPage();
      case 2:
        return const IndexPage();
      case 3:
        return const StocksPage();
      default:
        return const HomePage();
    }
  }
}
