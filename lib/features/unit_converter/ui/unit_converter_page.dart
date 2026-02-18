import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/features/unit_converter/view/unit_converter_view.dart';
import 'package:unit_converter/features/unit_converter/provider/unit_converter_controller.dart';

class UnitConverterPage extends StatelessWidget {
  final String title;
  final List<String> units;
  final String category;

  const UnitConverterPage({
    super.key,
    required this.title,
    required this.units,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UnitConverterController(category: category, units: units),
      child: UnitConverterView(title: title, category: category),
    );
  }
}
