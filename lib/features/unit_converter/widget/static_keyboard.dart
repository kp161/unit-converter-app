import 'package:flutter/material.dart';

class StaticKeyboard extends StatelessWidget{
  final Function(String) onKeyTap;
  const StaticKeyboard({super.key, required this.onKeyTap});

  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final keys = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '0', '⌫'];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: keys.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index){
        return GestureDetector(
          onTap: () => onKeyTap(keys[index]),
          child: Container(
            decoration: BoxDecoration(
              color: isDark ? Color(0xFF1B2138) : Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
              child: Text(
                keys[index],
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}