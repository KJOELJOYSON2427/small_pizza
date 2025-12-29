// bottom_nav_bar.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:small_pizza/config/theme/app_theme.dart';

class BottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final currentIndex = navigationShell.currentIndex;

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0, // controls how deep the curve is
      elevation: 12,
      color: AppTheme.lightSurface, // ← explicit white background
      child: SizedBox(
        height: 78, // ← increased a bit → most reliable
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side
            _TabItem(
              index: 0,
              assetPath: 'assets/img/tab_menu.png',
              label: 'Menu',
              currentIndex: currentIndex,
              onTap: () => navigationShell.goBranch(0, initialLocation: true),
            ),
            _TabItem(
              index: 1,
              assetPath: 'assets/img/tab_offer.png',
              label: 'Offers',
              currentIndex: currentIndex,
              onTap: () => navigationShell.goBranch(1, initialLocation: true),
            ),

            // Space for FAB (this creates the U-cut together with notchMargin)
            const SizedBox(width: 120), // ← 85–95 usually looks best
            // Right side
            _TabItem(
              index: 3,
              assetPath: 'assets/img/tab_profile.png',
              label: 'Profile',
              currentIndex: currentIndex,
              onTap: () => navigationShell.goBranch(3, initialLocation: true),
            ),
            _TabItem(
              index: 4,
              assetPath: 'assets/img/tab_more.png',
              label: 'More',
              currentIndex: currentIndex,
              onTap: () => navigationShell.goBranch(4, initialLocation: true),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final int index;
  final String assetPath;
  final String label;
  final int currentIndex;
  final VoidCallback onTap;

  const _TabItem({
    
    required this.index,
    required this.assetPath,
    required this.label,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = currentIndex == index;
    final color = isSelected ? AppTheme.primaryColor : Colors.grey.shade600;

    return Expanded(
      child: Material(
        color: AppTheme.lightSurface,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          splashColor: AppTheme.primaryColor.withOpacity(0.18),
          highlightColor: AppTheme.primaryColor.withOpacity(0.06),
          customBorder: const CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  assetPath,
                  width: 24, // ← slightly smaller = safer
                  height: 24,
                  color: color,
                  colorBlendMode: BlendMode.srcIn,
                ),
                const SizedBox(height: 3), // ← tight but readable
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10, // ← 10 is very safe
                    height: 1.05,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: color,
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
