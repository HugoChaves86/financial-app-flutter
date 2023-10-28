import 'package:flutter/material.dart';

import '../models/currency_data_model.dart';

class ConversorMoedas extends StatefulWidget {
  late Future<List<CurrencyData>>? currencyDataFuture;

  ConversorMoedas({super.key, required this.currencyDataFuture});

  @override
  ConversorMoedasState createState() => ConversorMoedasState();
}

class ConversorMoedasState extends State<ConversorMoedas> {
  Map<String, double> currencies = {};

  String originCoin = 'Real';
  String destinyCoin = 'Dólar Americano';
  String coin = '';

  double quantity = 0.0;
  double result = 0.0;

  void converter() {
    final double iniTax = currencies[originCoin]!;
    final double desTax = currencies[destinyCoin]!;

    final valueReal = quantity * iniTax;

    setState(() {
      result = valueReal / desTax;

      if (destinyCoin == "Real") {
        coin = 'R\$ ';
      } else if (destinyCoin == 'Dólar Americano') {
        coin = 'U\$ ';
      } else if (destinyCoin == 'Euro') {
        coin = '€ ';
      } else if (destinyCoin == 'Bitcoin') {
        coin = '₿ ';
      } else if (destinyCoin == 'Dólar Canadense') {
        coin = 'C\$ ';
      } else if (destinyCoin == 'Iene Japonês') {
        coin = '¥ ';
      } else if (destinyCoin == 'Yuan Chinês') {
        coin = '¥ ';
      } else if (destinyCoin == 'Peso Argentino') {
        coin = '\$ ';
      } else if (destinyCoin == 'Franco Suíço') {
        coin = 'Fr ';
      } else if (destinyCoin == 'Dólar Australiano') {
        coin = 'A\$ ';
      } else {
        coin = '\$ ';
      }
    });
  }

  void handleCurrencies() async {
    final currencyData = await widget.currencyDataFuture;

    final Map<String, double> currenciesTax = {};

    currenciesTax["Real"] = 1;

    for (var currency in currencyData!) {
      currenciesTax[currency.name.substring(0, currency.name.indexOf("/"))] =
          currency.ask;
    }

    setState(() {
      currencies = currenciesTax;
    });
  }

  @override
  Widget build(BuildContext context) {
    handleCurrencies();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(60, 59, 65, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(27, 26, 46, 1),
        title: const Text('Conversor de Moedas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(27, 26, 46, 1),
          ),
          margin: const EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    quantity = double.tryParse(value) ?? 0.0;
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Digite a quantidade',
                    hintStyle: TextStyle(color: Colors.black),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: DropdownButton<String>(
                  dropdownColor: const Color.fromARGB(255, 255, 255, 255),
                  value: originCoin,
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  onChanged: (String? newValue) {
                    setState(() {
                      originCoin = newValue!;
                    });
                  },
                  items: currencies.keys
                      .toList()
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: DropdownButton<String>(
                  dropdownColor: const Color.fromARGB(255, 255, 255, 255),
                  value: destinyCoin,
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  onChanged: (String? newValue) {
                    setState(() {
                      destinyCoin = newValue!;
                    });
                  },
                  items: currencies.keys
                      .toList()
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(60, 59, 65, 1)),
                  textStyle:
                      MaterialStateProperty.all(const TextStyle(fontSize: 20)),
                ),
                onPressed: converter,
                child: const Text('Converter'),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Resultado: $coin${result.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
