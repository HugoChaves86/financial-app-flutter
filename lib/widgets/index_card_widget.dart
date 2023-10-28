import 'package:flutter/material.dart';

class IndexCard extends StatelessWidget {
  final String name;
  final String symbol;
  final double regularMarketPrice;
  final DateTime lastTradeTime;

  const IndexCard({
    super.key,
    required this.name,
    required this.symbol,
    required this.regularMarketPrice,
    required this.lastTradeTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(27, 26, 46, 1),
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              symbol,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Preço: ${regularMarketPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            Text(
              'Última atualização: ${lastTradeTime.toString()}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
