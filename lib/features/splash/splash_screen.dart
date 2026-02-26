import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/features/category/provider/search_provider.dart';
import 'package:unit_converter/features/category/ui/category_page.dart';
import 'package:unit_converter/core/routes/smooth_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
    _controller.forward();

    final navigator = Navigator.of(context);

    Future.delayed(Duration(seconds: 3), () {
      if (!context.mounted) return;
      navigator.pushReplacement(
        smoothRoute(
          ChangeNotifierProvider(
            create: (_) => SearchProvider(),
            child: CategoryPage(),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/app_logo.png',
                  width: 160,
                  height: 160,
                ),
                const SizedBox(height: 32),
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color(0xFF4A47A3),
                      Color(0xFF4A47A3),
                      Color(0xFF2CC7F8),
                    ],
                  ).createShader(bounds),
                  child: const Text(
                    'ConvertX',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'SMART UNIT CONVERSION',
                  style: TextStyle(
                    color: isDark ? Colors.white38 : Colors.black54,
                    fontSize: 12,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
