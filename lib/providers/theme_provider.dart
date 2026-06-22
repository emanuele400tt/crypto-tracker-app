import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Manages the application's theme mode (light or dark).
/// Persists the user's preference securely using [FlutterSecureStorage].
class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;
  final _storage = const FlutterSecureStorage();
  final String _storageKey = 'app_theme_mode';

  /// Returns the current [ThemeMode] of the application.
  ThemeMode get themeMode => _themeMode;

  /// Returns true if the current theme is [ThemeMode.dark].
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  ThemeProvider() {
    _loadTheme();
  }

  /// Loads the saved theme preference from secure storage.
  Future<void> _loadTheme() async {
    final storedTheme = await _storage.read(key: _storageKey);
    if (storedTheme != null) {
      _themeMode = storedTheme == 'light' ? ThemeMode.light : ThemeMode.dark;
      notifyListeners();
    }
  }

  /// Toggles between light and dark themes, saves the preference,
  /// and notifies listeners to rebuild the UI.
  void toggleTheme() {
    if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;
      _storage.write(key: _storageKey, value: 'light');
    } else {
      _themeMode = ThemeMode.dark;
      _storage.write(key: _storageKey, value: 'dark');
    }
    notifyListeners();
  }
}
