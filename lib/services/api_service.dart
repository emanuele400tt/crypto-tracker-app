import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/coin_model.dart';

/// Handles network requests to the CoinGecko API.
class ApiService {
  static const String _baseUrl = 'https://api.coingecko.com/api/v3';

  /// Fetches the top 10 cryptocurrencies by market capitalization in EUR.
  ///
  /// Returns a [List] of [CoinModel]. Throws an [Exception] if the network request fails.
  Future<List<CoinModel>> getTopCoins() async {
    final url = Uri.parse(
      '$_baseUrl/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=10&page=1&sparkline=false',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        return jsonList
            .map((jsonItem) => CoinModel.fromJson(jsonItem))
            .toList();
      } else {
        throw Exception('Errore del server: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Errore di connessione: $e');
    }
  }
}
