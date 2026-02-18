import 'package:flutter/material.dart';

Route smoothRoute(Widget page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );

      // final slideAnimation = Tween<Offset>(
      //   begin: const Offset(0, 0.5),
      //   end: Offset.zero,
      // ).animate(fadeAnimation);

      // return FadeTransition(
      //   opacity: fadeAnimation,
      //   child: SlideTransition(position: slideAnimation, child: child),
      // );
    },
  );
}
