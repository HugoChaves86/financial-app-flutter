import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(60, 59, 65, 1),
      appBar: AppBar(
        title: const Text('Sobre'),
        backgroundColor: const Color.fromRGBO(27, 26, 46, 1),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const Card(
            color: Color.fromRGBO(27, 26, 46, 1),
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Este aplicativo, desenvolvido durante o Curso de Capacitação da UFBA em Desenvolvimento Mobile ministrado pelo prof. Rodrigo Rocha, objetiva disponibilizar os principais indices, moedas, taxas e ações do mercado financeiro.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
