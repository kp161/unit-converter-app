import 'package:flutter/material.dart';

class ConverterLogo extends StatelessWidget {
  const ConverterLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/app_logo.png',
      width: 38,
      height: 38,
      fit: BoxFit.contain,
    );
  }
}
