import 'package:atividade_flutter/pages/main_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              //const HomePage(title: 'App de Taxas e Câmbio')),
              const MainPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(60, 59, 65, 1),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.white),
            SizedBox(
              height: 100,
            ),
            Text(
              "Carregando informações...",
              style: TextStyle(
                  fontFamily: 'Open Sans',
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
