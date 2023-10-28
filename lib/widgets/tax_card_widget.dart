import 'package:flutter/material.dart';

class TaxCard extends StatelessWidget {
  final String name;
  final String date;
  final double value;

  const TaxCard({
    super.key,
    required this.name,
    required this.date,
    required this.value,
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
              'Valor: ${value.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            Text(
              'Última atualização: ${date.toString()}',
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

// class IndexCard extends StatelessWidget {
//   final IndexInfo indexInfo;

//   const IndexCard({super.key, required this.indexInfo});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(indexInfo.name),
//             Text(indexInfo.abbreviation),
//             Text('Valor: ${indexInfo.value.toString()}'),
//             Text('Variação: ${indexInfo.change.toString()}%'),
//           ],
//         ),
//       ),
//     );
//   }
// }
