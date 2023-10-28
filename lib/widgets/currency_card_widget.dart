import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String title;
  final double value;

  const CurrencyCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: const Color.fromRGBO(60, 59, 65, 1),
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'R\$ ${value.toStringAsFixed(2)}', // Mostra o valor com duas casas decimais
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
