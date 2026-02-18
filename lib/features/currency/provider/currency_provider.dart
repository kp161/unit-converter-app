import 'package:flutter/material.dart';
import 'package:unit_converter/core/services/currency_service.dart';

class CurrencyProvider extends ChangeNotifier{
  final CurrencyService _api = CurrencyService();

  String from = 'USD';
  String to = 'INR';

  double input = 1.0;
  double result = 0.0;

  bool isLoading = false;

  Map<String, double> _rates = {};

  Future<void> fetchRates() async {
    isLoading = true;
    notifyListeners();

    _rates = await _api.getRates(from);

    isLoading = false;
    convert();
  }

  void setFrom(String value){
    from = value;
    fetchRates();
  }

  void setTo(String value){
    to = value;
    convert();
  }

  void setInput(double value){
    input = value;
    convert();
  }

  void convert() {
    if(_rates.isEmpty || !_rates.containsKey(to)) return;

    result = input * _rates[to]!;
    notifyListeners();
  }
}