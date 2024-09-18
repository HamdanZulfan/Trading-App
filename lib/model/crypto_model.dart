class CryptoData {
  final String symbol;
  final double price;
  final double dailyChange;
  final double dailyDifference;
  final DateTime timestamp;

  CryptoData(
      {required this.symbol,
      required this.price,
      required this.dailyChange,
      required this.dailyDifference,
      required this.timestamp});
}
