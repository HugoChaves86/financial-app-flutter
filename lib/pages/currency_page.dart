import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:atividade_flutter/widgets/conversor_moedas_widget.dart';
import 'package:flutter/material.dart';
import 'package:atividade_flutter/widgets/list_currency_widget.dart';

import '../models/currency_data_model.dart';

Future<List<CurrencyData>> fetchCurrencyData() async {
  final response = await http.get(Uri.parse(
      'https://economia.awesomeapi.com.br/json/last/USD-BRL,EUR-BRL,BTC-BRL,CAD-BRL,JPY-BRL,CNY-BRL,ARS-BRL,CHF-BRL,AUD-BRL'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    List<CurrencyData> currencies = [];

    data.forEach((key, value) {
      final currencyData = CurrencyData.fromJson(value);
      currencies.add(currencyData);
    });
    return currencies;
  } else {
    throw Exception('Failed to load currency data');
  }
}

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({super.key});

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  late Future<List<CurrencyData>> _currencyDataFuture;
  @override
  void initState() {
    super.initState();
    _currencyDataFuture = fetchCurrencyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(60, 59, 65, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 500,
                width: 700,
                child: ListCurrency(currencyDataFuture: _currencyDataFuture),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40, bottom: 40),
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(27, 26, 46, 1)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 20)),
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConversorMoedas(
                            currencyDataFuture: _currencyDataFuture,
                          ),
                        ),
                      );
                    },
                    child: const Text('Converter Moedas'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
