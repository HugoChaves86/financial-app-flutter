class StockData {
  final String symbol;
  final String name;
  final String currency;
  final double high;
  final double low;
  final double price;
  final int volume;
  final String regularMarketTime;

  StockData({
    required this.symbol,
    required this.name,
    required this.high,
    required this.low,
    required this.price,
    required this.volume,
    required this.currency,
    required this.regularMarketTime
  });

  factory StockData.fromJson(Map<String, dynamic> json) {


    return StockData(
      symbol: json['symbol'],
      name: json['longName'],
      currency: json['currency'],
      high: json['regularMarketDayHigh'],
      low: json['regularMarketDayLow'],
      price: json['regularMarketPrice'],
      volume: json['regularMarketVolume'],
      regularMarketTime: json["regularMarketTime"]
    );
  }
}
