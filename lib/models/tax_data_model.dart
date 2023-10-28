class TaxData {
  String name;
  final String date;
  final double value;

  TaxData({required this.name, required this.date, required this.value});

  factory TaxData.fromJson(Map<String, dynamic> json) {
    return TaxData(
        name: "", date: json["data"], value: double.parse(json["valor"]));
  }
}
