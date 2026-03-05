import 'package:unit_converter/core/services/currency_service.dart';

class CurrencyConverterEngine {
  static final CurrencyService _api = CurrencyService();

  static Map<String, double> _rates = {};
  static bool _loaded = false;

  static String _extractCode(String value){
    return value.split(' ').first;
  }

  static Future<void> _loadRates() async {
    if(!_loaded) {
      _rates = await _api.getRates("USD");
      _rates["USD"] = 1.0;
      _loaded = true;
    }
  }

  static Future<double> convert({
    required String from,
    required String to,
    required double value,
  }) async {
    await _loadRates();

    final fromCode = _extractCode(from);
    final toCode = _extractCode(to);

    if(!_rates.containsKey(fromCode) || !_rates.containsKey(toCode)){
      return 0;
    }

    double fromRate = _rates[fromCode]!;
    double toRate = _rates[toCode]!;

    return value * (toRate/fromRate);
  }
}