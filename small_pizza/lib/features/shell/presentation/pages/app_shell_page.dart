// app_shell.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:small_pizza/config/theme/app_theme.dart';
import '../../../shell/presentation/widgets/bottom_nav_bar.dart'; // adjust import path

class AppShellPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppShellPage({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final isHomeActive = navigationShell.currentIndex == 2;

    return Scaffold(
      body: navigationShell,
      extendBody: true,
      extendBodyBehindAppBar: true, // ← optional: cleaner look on scroll
      backgroundColor: Colors.grey.shade50, // ← light background recommended
      bottomNavigationBar: BottomNavBar(navigationShell: navigationShell),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Transform.scale(
          scale: isHomeActive
              ? 1.25
              : 1.0, // ← 1.25–1.4 feels very prominent without being huge
          child: FloatingActionButton(
            backgroundColor: isHomeActive
                ? AppTheme.primaryColor
                : Colors.grey.shade300,
        
            foregroundColor: AppTheme.lightSurface,
        
            elevation: isHomeActive ? 10 : 4,
            highlightElevation: isHomeActive ? 14 : 6,
        
            shape: const CircleBorder(),
        
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(
                'assets/img/tab_home.png',
                width: isHomeActive
                    ? 24
                    : 20, // icon still scales a bit, but circle grows more
                height: isHomeActive ? 24 : 20,
                color: Colors.white,
              ),
            ),
        
            onPressed: () => navigationShell.goBranch(2, initialLocation: true),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
