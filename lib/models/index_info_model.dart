class IndexInfo {
  final String name;
  final String currency;
  final double regularMarketPrice;
  final String symbol;
  final double change;
  final double changePercent;
  final DateTime lastTradeTime;

  IndexInfo({
    required this.name,
    required this.currency,
    required this.regularMarketPrice,
    required this.symbol,
    required this.change,
    required this.changePercent,
    required this.lastTradeTime,
  });

  factory IndexInfo.fromJson(Map<String, dynamic> json) {
    return IndexInfo(
      name: json['shortName'] ?? '',
      currency: json['currency'] ?? '',
      regularMarketPrice: json['regularMarketPrice'] ?? 0.0,
      symbol: json['symbol'] ?? '',
      change: json['change'] ?? 0.0,
      changePercent: json['change_percent'] ?? 0.0,
      lastTradeTime: DateTime.now(),
    );
  }

  @override
  String toString() {
    return 'IndexInfo(Nome: $name, Currency: $currency, Valor: $regularMarketPrice, symbol: $symbol, change: $change, changePercent: $changePercent, lastTradeTime: $lastTradeTime)';
  }
}



// class IndexInfo {
//   final String name;
//   final String abbreviation;
//   final double value;
//   final double change;

//   IndexInfo({
//     required this.name,
//     required this.abbreviation,
//     required this.value,
//     required this.change,
//   });
// }