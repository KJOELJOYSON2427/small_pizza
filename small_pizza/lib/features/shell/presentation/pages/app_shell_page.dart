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
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: isHomeActive
            ? AppTheme.primaryColor
            : Colors.grey.shade300,
        foregroundColor: AppTheme.lightSurface,
        elevation: isHomeActive ? 10 : 4,
        highlightElevation: isHomeActive ? 14 : 8,
        shape: const CircleBorder(),
       
        onPressed: () => navigationShell.goBranch(2, initialLocation: true),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/img/tab_home.png',
            width: isHomeActive ? 52 : 32,
            height: isHomeActive ? 52 : 32,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
