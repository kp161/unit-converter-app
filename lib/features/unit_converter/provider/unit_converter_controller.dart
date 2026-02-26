import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:unit_converter/core/utils/currency_converter_engine.dart';
import 'package:unit_converter/core/utils/show_snackbar.dart';
import 'package:unit_converter/core/utils/unit_converter_engine.dart';

class UnitConverterController extends ChangeNotifier {
  bool _isDisposed  = false;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  late String fromUnit;
  late String toUnit;

  Currency fromCurrency = Currency(
    code: "USD",
    name: "United States Dollar",
    symbol: '\$',
    flag: "us",
    number: 840,
    decimalDigits: 2,
    namePlural: "US dollars",
    symbolOnLeft: true,
    decimalSeparator: '.',
    thousandsSeparator: ',',
    spaceBetweenAmountAndSymbol: false,
  );
  Currency toCurrency = Currency(
    code: "INR",
    name: "Indian Rupee",
    symbol: '₹',
    flag: "IN",
    number: 356,
    decimalDigits: 2,
    namePlural: "Indian rupees",
    symbolOnLeft: true,
    decimalSeparator: ".",
    thousandsSeparator: ",",
    spaceBetweenAmountAndSymbol: false,
  );

  String inputValue = '0';
  String resultValue = '0';

  final String category;
  final List<String> units;

  UnitConverterController({required this.category, required this.units}) {
    fromUnit = units.first;
    toUnit = units[1];
  }

  void _safeNotify() {
    if(!_isDisposed){
      notifyListeners();
    }
  }

  void onKeyTap(String key, BuildContext context) {
    if (key == '⌫') {
      if (inputValue.length > 1) {
        inputValue = inputValue.substring(0, inputValue.length - 1);
      } else {
        inputValue = '0';
      }
    } else {
      if (inputValue == '0') {
        inputValue = key;
      } else {
        inputValue += key;
      }
    }

    convert(context);
    _safeNotify();
  }

  Future<void> convert(BuildContext context) async {
    final input = double.tryParse(inputValue) ?? 0;

    try {
      if (category == 'currency') {
        final result = await CurrencyConverterEngine.convert(
          from: fromCurrency.code,
          to: toCurrency.code,
          value: input,
        );

        resultValue = _format(result);
      } else {
        final result = UnitConverterEngine.convert(
          category: category,
          from: fromUnit,
          to: toUnit,
          value: input,
        );
        resultValue = _format(result);
      }
    } catch (e) {
      resultValue = "N/A";
      if(!context.mounted) return;
      showFlushBar(
        context: context,
        message: "This currency pair is not supported.",
        isError: true,
      );
    }
    _safeNotify();
  }

  Future<void> swapUnits(BuildContext context) async {
    if (category == "currency") {
      final tempcurrency = fromCurrency;
      fromCurrency = toCurrency;
      toCurrency = tempcurrency;
    } else {
      final tempUnit = fromUnit;
      fromUnit = toUnit;
      toUnit = tempUnit;
    }
    await convert(context);
  }

  String _format(double value) {
    return value.toStringAsFixed(6).replaceFirst(RegExp(r'\.?0+$'), '');
  }

  void setFromUnit(String val, BuildContext context) {
    fromUnit = val;
    convert(context);
  }

  void setToUnit(String val, BuildContext context) {
    toUnit = val;
    convert(context);
  }

  Future<void> setFromCurrency(Currency c, BuildContext context) async {
    fromCurrency = c;
    fromUnit = c.code;
    await convert(context);
  }

  Future<void> setToCurrency(Currency c, BuildContext context) async {
    toCurrency = c;
    toUnit = c.code;
    await convert(context);
  }
}
