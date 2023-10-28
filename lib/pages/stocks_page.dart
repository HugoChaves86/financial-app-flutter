import 'dart:convert';

import 'package:atividade_flutter/widgets/stock_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import '../models/stock_data_model.dart';

class StocksPage extends StatefulWidget {
  const StocksPage({super.key});

  @override
  State<StocksPage> createState() => _StocksPageState();
}

Future<StockData> fetchStockData(String stockName) async {
  final name = stockName.toUpperCase();

  final apiURL = "https://brapi.dev/api/quote/$name";

  final response = await http.get(Uri.parse(apiURL));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body)["results"][0];
    final stock = StockData.fromJson(data);

    return stock;
  } else {
    throw Exception('Failed to load stock data');
  }
}

class _StocksPageState extends State<StocksPage> {
  String stockName = "";

  Future<StockData>? _stockDataFuture;

  @override
  void initState() {
    super.initState();
    _stockDataFuture = null;
  }

  void searchStock() {
    setState(() {
      _stockDataFuture = fetchStockData(stockName);
    });
  }

  void changeStockName(String newText) {
    setState(() {
      stockName = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(60, 59, 65, 1),
      body: Center(
          child: SizedBox(
        height: 400,
        width: 400,
        child: SingleChildScrollView(
            child: Column(
          children: [
            TextField(
              onChanged: changeStockName,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Ex: ITSA4',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(27, 26, 46, 1)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 20)),
                  ),
                  onPressed: searchStock,
                  child: const Text("Pesquisar")),
            ),
            FutureBuilder(
              future: _stockDataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Lottie.asset(
                    'assets/animation_currency.json', // Caminho para o arquivo .json
                    height: 200,
                    width: 200,
                    repeat: true,
                    reverse: false,
                    animate: true,
                  );
                } else if (snapshot.hasError) {
                  return const Text('Digite uma sigla válida.');
                } else if (snapshot.hasData) {
                  final stock = snapshot.data!;
                  return StockCard(
                    symbol: stock.symbol,
                    currency: stock.currency,
                    name: stock.name,
                    price: stock.price,
                    highPrice: stock.high,
                    lowPrice: stock.low,
                    volume: stock.volume,
                    regularMarketTime: stock.regularMarketTime,
                  );
                } else {
                  return const Text(
                      ""); // Pode ser um widget vazio, caso não queira exibir nada
                }
              },
            )
          ],
        )),
      )),
    );
  }
}


// FutureBuilder(
//               future: _stockDataFuture,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const CircularProgressIndicator();
//                 } else if (snapshot.hasError) {
//                   return Text('Erro ao carregar os dados: ${snapshot.error}');
//                 } else if (snapshot.hasData) {
//                   final stock = snapshot.data!;
//                   print(stock);
//                   return StockCard(
//                       symbol: stock.symbol,
//                       currency: stock.currency,
//                       name: stock.name,
//                       price: stock.price,
//                       highPrice: stock.high,
//                       lowPrice: stock.low,
//                       volume: stock.volume);
//                 } else {
//                   return const Text(
//                       "Placeholder"); // Pode ser um widget vazio, caso não queira exibir nada
//                 }
//               },
//             )