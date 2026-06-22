import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/coin_model.dart';
import '../providers/favorites_provider.dart';
import '../services/api_service.dart';
import '../widgets/crypto_card.dart';
import 'detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<CoinModel>> _cryptoFuture;

  @override
  void initState() {
    super.initState();
    _cryptoFuture = _apiService.getTopCoins();
  }

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = context.watch<FavoritesProvider>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'La mia Watchlist',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<CoinModel>>(
        future: _cryptoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: isDark ? const Color(0xFFDEFF9A) : Colors.blueAccent,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Errore: ${snapshot.error}',
                style: const TextStyle(color: Colors.redAccent),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nessuna moneta trovata.'));
          }

          final allCoins = snapshot.data!;

          final favoriteCoins = allCoins.where((coin) {
            return favoritesProvider.isFavorite(coin.id);
          }).toList();

          if (favoriteCoins.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: isDark ? Colors.white24 : Colors.black12,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Nessuna moneta nei preferiti.',
                    style: TextStyle(
                      color: isDark ? Colors.white54 : Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: favoriteCoins.length,
            itemBuilder: (context, index) {
              final coin = favoriteCoins[index];
              return CryptoCard(
                name: coin.name,
                symbol: coin.symbol,
                price: coin.currentPrice,
                changePercentage: coin.priceChangePercentage24h,
                imageUrl: coin.imageUrl,
                isFavorite: true,
                onFavoriteToggle: () {
                  favoritesProvider.toggleFavorite(coin.id);
                },
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 400),
                      reverseTransitionDuration: const Duration(
                        milliseconds: 400,
                      ),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          DetailScreen(coin: coin),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
