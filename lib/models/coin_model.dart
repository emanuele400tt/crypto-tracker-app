/// Represents a cryptocurrency coin with its market data.
class CoinModel {
  final String id;
  final String name;
  final String symbol;
  final double currentPrice;
  final double priceChangePercentage24h;
  final String imageUrl;

  CoinModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.currentPrice,
    required this.priceChangePercentage24h,
    required this.imageUrl,
  });

  /// Creates a [CoinModel] instance from a JSON map provided by the CoinGecko API.
  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      symbol: json['symbol']?.toString().toUpperCase() ?? '',
      currentPrice: (json['current_price'] ?? 0).toDouble(),
      priceChangePercentage24h: (json['price_change_percentage_24h'] ?? 0)
          .toDouble(),
      imageUrl: json['image'] ?? '',
    );
  }
}
