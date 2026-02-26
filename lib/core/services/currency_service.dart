import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CurrencyService {
  static const String _baseUrl = 'https://api.frankfurter.app';
  static const String _cacheKey = 'cached_rates_';

  Future<Map<String, double>> getRates(String base) async {
    final url = Uri.parse('$_baseUrl/latest?from=$base');
    final prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.get(url).timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final Map<String, dynamic> rates = data['rates'];

        await prefs.setString('$_cacheKey$base', jsonEncode(rates));

        return _parseRates(rates);
      }
    } catch (e) {
      final String? cachedData = prefs.getString('$_cacheKey$base');

      if (cachedData != null) {
        return _parseRates(jsonDecode(cachedData));
      }
    }
    return {};
  }

  Map<String, double> _parseRates(Map<String, dynamic> rates) {
    return rates.map((key, value) => MapEntry(key, (value as num).toDouble()));
  }
}
