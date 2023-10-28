import 'package:flutter/material.dart';

class StockCard extends StatelessWidget {
  final String symbol;
  final String currency;
  final String name;
  final double price;
  final double highPrice;
  final double lowPrice;
  final int volume;
  final String regularMarketTime;

  const StockCard(
      {super.key,
      required this.symbol,
      required this.currency,
      required this.name,
      required this.price,
      required this.highPrice,
      required this.lowPrice,
      required this.volume,
      required this.regularMarketTime});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$symbol ($currency)',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Text('Preço: \$${price.toStringAsFixed(2)}'),
            Text('Maior preço do dia: \$${highPrice.toStringAsFixed(2)}'),
            Text('Menor preço do dia: \$${lowPrice.toStringAsFixed(2)}'),
            Text('Volume: $volume'),
            Text("Data: $regularMarketTime")
          ],
        ),
      ),
    );
  }
}
