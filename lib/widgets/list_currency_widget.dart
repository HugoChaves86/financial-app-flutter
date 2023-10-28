import 'package:flutter/material.dart';

import '../models/currency_data_model.dart';

import '../widgets/currency_card_widget.dart';

import 'package:lottie/lottie.dart';

class ListCurrency extends StatefulWidget {
  late Future<List<CurrencyData>>? currencyDataFuture;

  ListCurrency({super.key, this.currencyDataFuture});

  @override
  State<ListCurrency> createState() => _ListCurrencyState();
}

class _ListCurrencyState extends State<ListCurrency> {
  // late Future<List<CurrencyData>> _currencyDataFuture;
  // @override
  // void initState() {
  //   super.initState();
  //   _currencyDataFuture = fetchCurrencyData();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(27, 26, 46, 1),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text(
              "Valores das Moedas:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 350,
            width: 400,
            child: FutureBuilder<List<CurrencyData>>(
              future: widget.currencyDataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Lottie.asset(
                    'assets/animation_currency.json', // Caminho para o arquivo .json
                    height: 300,
                    width: 300,
                    repeat: true,
                    reverse: false,
                    animate: true,
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return ListView.separated(
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      final currency = snapshot.data![index];
                      return CurrencyCard(
                          title: currency.name, value: currency.bid);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
