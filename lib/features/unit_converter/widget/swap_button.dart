import 'package:flutter/material.dart';

class SwapButton extends StatelessWidget{
  final VoidCallback onTap;
  const SwapButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42,
        width: 42,
        decoration: BoxDecoration(
          color: Color(0xFF4F46E5),
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.swap_vert_rounded, color: Colors.white),
      ),
    );
  }
}