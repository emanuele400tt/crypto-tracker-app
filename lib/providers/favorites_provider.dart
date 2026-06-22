import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Manages the state of the user's favorite cryptocurrencies.
/// Utilizes [FlutterSecureStorage] for secure, persistent local storage.
class FavoritesProvider extends ChangeNotifier {
  List<String> _favoriteCoins = [];

  final _storage = const FlutterSecureStorage();
  final String _storageKey = 'favorite_coins_secure';

  List<String> get favoriteCoins => _favoriteCoins;

  FavoritesProvider() {
    _loadFavorites();
  }

  /// Loads favorites from secure storage upon initialization.
  Future<void> _loadFavorites() async {
    try {
      final String? storedData = await _storage.read(key: _storageKey);

      if (storedData != null) {
        List<dynamic> decoded = json.decode(storedData);
        _favoriteCoins = decoded.cast<String>();
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Errore nel caricamento dei preferiti: $e');
    }
  }

  /// Persists the current favorites list to secure storage.
  Future<void> _saveFavorites() async {
    try {
      final String encodedData = json.encode(_favoriteCoins);
      await _storage.write(key: _storageKey, value: encodedData);
    } catch (e) {
      debugPrint('Errore nel salvataggio dei preferiti: $e');
    }
  }

  /// Toggles the favorite status of a specific coin ID.
  void toggleFavorite(String coinId) {
    if (_favoriteCoins.contains(coinId)) {
      _favoriteCoins.remove(coinId);
    } else {
      _favoriteCoins.add(coinId);
    }

    _saveFavorites();
    notifyListeners();
  }

  /// Checks if a specific coin ID is currently marked as favorite.
  bool isFavorite(String coinId) {
    return _favoriteCoins.contains(coinId);
  }
}
