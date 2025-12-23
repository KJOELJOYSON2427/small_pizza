import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // ⏳ Auto navigate after 2 seconds

    Timer(const Duration(seconds: 2), () {
      context.go('/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // ← Now using the theme!

    return Scaffold(
      backgroundColor:
          theme.scaffoldBackgroundColor, // Uses AppTheme.lightBg (pure white)
      body: Stack(
        children: [
          // Light background pattern (subtle overlay)
          Positioned.fill(
            child: Image.asset(
              'assets/img/splash_bg.png',
              fit: BoxFit.cover,
              color: Colors.black.withValues(
                alpha: 0.03,
              ), // Minor: withOpacity is more common than withValues
              colorBlendMode: BlendMode.srcIn,
            ),
          ),

          // Center content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [Image.asset('assets/img/app_logo.png', height: 120)],
            ),
          ),
        ],
      ),
    );
  }
}
