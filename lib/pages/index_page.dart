import 'package:atividade_flutter/models/tax_data_model.dart';
import 'package:atividade_flutter/widgets/tax_card_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import '../widgets/index_card_widget.dart';
import '../models/index_info_model.dart';

Future<List<IndexInfo>> fetchQuoteData() async {
  const String apiUrl = 'https://brapi.dev/api/quote/^BVSP,^NYA,^IXIC,^GSPC';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = json.decode(response.body);
    final quoteData = jsonData['results'] as List<dynamic>;

    List<IndexInfo> index =
        quoteData.map((quoteJson) => IndexInfo.fromJson(quoteJson)).toList();
    return index;
  } else {
    throw Exception('Falha ao carregar os dados da cotação');
  }
}

Future<List<TaxData>> fetchTaxesData() async {
  const String urlIPCA =
      "https://api.bcb.gov.br/dados/serie/bcdata.sgs.433/dados/ultimos/1?formato=json";
  const String urlIGPM =
      "https://api.bcb.gov.br/dados/serie/bcdata.sgs.189/dados/ultimos/1?formato=json";
  const String urlSELIC =
      "https://api.bcb.gov.br/dados/serie/bcdata.sgs.432/dados/ultimos/1?formato=json";
  const String urlCDI =
      "https://api.bcb.gov.br/dados/serie/bcdata.sgs.12/dados/ultimos/1?formato=json";

  final ipcaResponse = await http.get(Uri.parse(urlIPCA));
  final igpmResponse = await http.get(Uri.parse(urlIGPM));
  final selicResponse = await http.get(Uri.parse(urlSELIC));
  final cdiResponse = await http.get(Uri.parse(urlCDI));

  List<TaxData> taxes = [];

  if (ipcaResponse.statusCode == 200) {
    final ipca = TaxData.fromJson(json.decode(ipcaResponse.body)[0]);
    ipca.name = "IPCA";

    taxes.add(ipca);
  } else {
    throw Exception("Falha ao carregar os dados do IPCA");
  }

  if (igpmResponse.statusCode == 200) {
    final igpm = TaxData.fromJson(json.decode(igpmResponse.body)[0]);
    igpm.name = "IGPM";
    taxes.add(igpm);
  } else {
    throw Exception("Falha ao carregar os dados do IGPM");
  }

  if (selicResponse.statusCode == 200) {
    final selic = TaxData.fromJson(json.decode(selicResponse.body)[0]);
    selic.name = "SELIC";
    taxes.add(selic);
  } else {
    throw Exception("Falha ao carregar os dados da Selic");
  }

  if (cdiResponse.statusCode == 200) {
    final cdi = TaxData.fromJson(json.decode(cdiResponse.body)[0]);
    cdi.name = "CDI";
    taxes.add(cdi);
  } else {
    throw Exception("Falha ao carregar os dados do CDI");
  }

  return taxes;
}

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  late Future<List<IndexInfo>> _quoteFuture;
  late Future<List<TaxData>> _taxesFuture;

  @override
  void initState() {
    super.initState();
    _quoteFuture = fetchQuoteData();
    _taxesFuture = fetchTaxesData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: const Color.fromRGBO(60, 59, 65, 1),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 250,
                width: 600,
                child: FutureBuilder<List<TaxData>>(
                  future: _taxesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                          child: Text('Erro ao carregar os dados'));
                    } else {
                      final taxes = snapshot.data!;

                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 1.5),
                        itemCount: taxes.length,
                        itemBuilder: (BuildContext context, index) {
                          return TaxCard(
                              name: taxes[index].name,
                              date: taxes[index].date,
                              value: taxes[index].value);
                        },
                      );
                    }
                  },
                ),
              ),
              const Divider(
                height: 10,
                color: Colors.white,
              ),
              SizedBox(
                height: 250,
                width: 600,
                child: FutureBuilder<List<IndexInfo>>(
                  future: _quoteFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                          child: Text('Erro ao carregar os dados'));
                    } else {
                      final quoteList = snapshot.data;

                      return ListView.builder(
                        itemCount: quoteList!.length,
                        itemBuilder: (context, index) {
                          final quote = quoteList[index];
                          return IndexCard(
                              name: quote.name,
                              symbol: quote.symbol,
                              regularMarketPrice: quote.regularMarketPrice,
                              lastTradeTime: quote.lastTradeTime);
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
