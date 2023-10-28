class CurrencyData {
  final String name;
  final String code;
  final String codein;
  final double high;
  final double low;
  final double varBid;
  final double pctChange;
  final double bid;
  final double ask;

  CurrencyData({
    required this.name,
    required this.code,
    required this.codein,
    required this.high,
    required this.low,
    required this.varBid,
    required this.pctChange,
    required this.bid,
    required this.ask,
  });

  factory CurrencyData.fromJson(Map<String, dynamic> json) {
    return CurrencyData(
      name: json['name'],
      code: json['code'],
      codein: json['codein'],
      high: double.parse(json['high']),
      low: double.parse(json['low']),
      varBid: double.parse(json['varBid']),
      pctChange: double.parse(json['pctChange']),
      bid: double.parse(json['bid']),
      ask: double.parse(json['ask']),
    );
  }
}
