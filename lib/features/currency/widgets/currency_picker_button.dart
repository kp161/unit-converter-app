import 'package:flutter/material.dart';
import 'package:currency_picker/currency_picker.dart';

class CurrencyPickerButton extends StatelessWidget{
  final Currency currency;
  final ValueChanged<Currency> onSelect;

  const CurrencyPickerButton({
    super.key,
    required this.currency,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCurrencyPicker(
          context: context,
          showFlag: true,
          showCurrencyCode: true,
          showCurrencyName: true,
          onSelect: onSelect,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[400]!),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(currency.flag!),
            const SizedBox(width: 6),
            Text(
              currency.code,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}