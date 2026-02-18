import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyService {
  static const String _baseUrl = 'https://api.frankfurter.app';

  Future<Map<String, double>> getRates(String base) async {
    final url = Uri.parse('$_baseUrl/latest?from=$base');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final Map<String, dynamic> rates = data['rates'];

      return rates.map(
        (key, value) => MapEntry(key, (value as num).toDouble()),
      );
    } else {
      throw Exception('Currency API error');
    }
  }
}
