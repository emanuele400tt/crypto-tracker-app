import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/coin_model.dart';
import '../providers/favorites_provider.dart';

class DetailScreen extends StatelessWidget {
  final CoinModel coin;

  const DetailScreen({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    final isFavorite = context.watch<FavoritesProvider>().isFavorite(coin.id);

    final isDark = Theme.of(context).brightness == Brightness.dark;

    final isPositive = coin.priceChangePercentage24h >= 0;

    final color = isPositive
        ? (isDark ? const Color(0xFFDEFF9A) : const Color(0xFF2E7D32))
        : (isDark ? Colors.redAccent : Colors.red);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          coin.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite
                  ? Colors.redAccent
                  : (isDark ? Colors.white : Colors.black87),
            ),
            onPressed: () {
              context.read<FavoritesProvider>().toggleFavorite(coin.id);
            },
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Hero(
              tag: coin.symbol,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(coin.imageUrl),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              coin.symbol.toUpperCase(),
              style: TextStyle(
                fontSize: 20,
                color: isDark ? Colors.white54 : Colors.black54,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '€ ${coin.currentPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${isPositive ? '+' : ''}${coin.priceChangePercentage24h.toStringAsFixed(2)}% nelle ultime 24h',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: SizedBox(
                height: 250,
                child: LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: false),
                    titlesData: const FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineTouchData: const LineTouchData(enabled: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 1),
                          const FlSpot(1, 1.5),
                          const FlSpot(2, 1.2),
                          const FlSpot(3, 2.8),
                          const FlSpot(4, 2.0),
                          const FlSpot(5, 2.4),
                          const FlSpot(6, 1.9),
                          FlSpot(7, isPositive ? 3.5 : 0.5),
                        ],
                        isCurved: true,
                        color: color,
                        barWidth: 4,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              color.withValues(alpha: 0.4),
                              color.withValues(alpha: 0.0),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
