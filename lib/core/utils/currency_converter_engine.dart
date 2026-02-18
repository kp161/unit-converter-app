import 'package:unit_converter/core/services/currency_service.dart';

class CurrencyConverterEngine {
  static final CurrencyService _api = CurrencyService();

  static Map<String, double> _rates = {};
  static String _lastBase = '';

  static String _extractCode(String value){
    return value.split(' ').first;
  }

  static Future<double> convert({
    required String from,
    required String to,
    required double value,
  }) async {
    final fromCode = _extractCode(from);
    final toCode = _extractCode(to);

    if(_rates.isEmpty || _lastBase != fromCode){
      _rates = await _api.getRates(fromCode);
      _lastBase = fromCode;
    }

    if(!_rates.containsKey(toCode)) return 0;

    return value * _rates[toCode]!;
  }
}