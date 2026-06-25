import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/crypto_card.dart';
import '../services/api_service.dart';
import '../models/coin_model.dart';
import '../providers/favorites_provider.dart';
import '../providers/theme_provider.dart';
import 'favorites_screen.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<CoinModel>> _cryptoFuture;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _cryptoFuture = _apiService.getTopCoins();
  }

  Future<void> _refreshData() async {
    setState(() {
      _cryptoFuture = _apiService.getTopCoins();
    });
    await _cryptoFuture;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final isDark = themeProvider.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crypto Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.redAccent),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritesScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return RotationTransition(
                  turns: animation,
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode,
                key: ValueKey<bool>(isDark),
                color: isDark ? const Color(0xFFDEFF9A) : Colors.amber,
              ),
            ),
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: isDark ? const Color(0xFFDEFF9A) : Colors.blueAccent,
            ),
            onPressed: _refreshData,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Andamento Mercato (Top 10)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
              decoration: InputDecoration(
                hintText: 'Cerca per nome o simbolo...',
                hintStyle: TextStyle(
                  color: isDark ? Colors.white54 : Colors.black54,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: isDark ? Colors.white54 : Colors.black54,
                ),
                filled: true,
                fillColor: Theme.of(context).cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<CoinModel>>(
                future: _cryptoFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: isDark
                            ? const Color(0xFFDEFF9A)
                            : Colors.blueAccent,
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

                  final coins = snapshot.data!;
                  final filteredCoins = _searchQuery.isEmpty
                      ? coins
                      : coins.where((coin) {
                          final query = _searchQuery.toLowerCase();
                          return coin.name.toLowerCase().contains(query) ||
                              coin.symbol.toLowerCase().contains(query);
                        }).toList();

                  return RefreshIndicator(
                    color: isDark ? const Color(0xFF121212) : Colors.white,
                    backgroundColor: isDark
                        ? const Color(0xFFDEFF9A)
                        : Colors.blueAccent,
                    onRefresh: _refreshData,
                    child: filteredCoins.isEmpty
                        ? ListView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            children: [
                              const SizedBox(height: 50),
                              Center(
                                child: Text(
                                  'Nessuna moneta trovata per "$_searchQuery"',
                                  style: TextStyle(
                                    color: isDark
                                        ? Colors.white70
                                        : Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: filteredCoins.length,
                            itemBuilder: (context, index) {
                              final coin = filteredCoins[index];
                              final isFav = context
                                  .watch<FavoritesProvider>()
                                  .isFavorite(coin.id);

                              return CryptoCard(
                                name: coin.name,
                                symbol: coin.symbol,
                                price: coin.currentPrice,
                                changePercentage: coin.priceChangePercentage24h,
                                imageUrl: coin.imageUrl,
                                isFavorite: isFav,
                                onFavoriteToggle: () {
                                  context
                                      .read<FavoritesProvider>()
                                      .toggleFavorite(coin.id);
                                },
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration: const Duration(
                                        milliseconds: 400,
                                      ),
                                      reverseTransitionDuration: const Duration(
                                        milliseconds: 400,
                                      ),
                                      pageBuilder:
                                          (
                                            context,
                                            animation,
                                            secondaryAnimation,
                                          ) => DetailScreen(coin: coin),
                                      transitionsBuilder:
                                          (
                                            context,
                                            animation,
                                            secondaryAnimation,
                                            child,
                                          ) {
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
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
