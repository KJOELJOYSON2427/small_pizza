import 'package:flutter/material.dart';

import 'package:small_pizza/config/theme/app_theme.dart'; // ← import your theme (for primaryColor)

class MenuHeader extends StatelessWidget {
  final VoidCallback? onCartTap;

  const MenuHeader({
    super.key,
    this.onCartTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 16, 12), // more balanced spacing
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title with orange accent
          Text(
            'Menu',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontSize: 28,                  // bigger & bolder
              fontWeight: FontWeight.w800,    // extra bold for impact
              color: AppTheme.lightText,   // orange title
              letterSpacing: 0.5,
            ),
          ),

          // Cart button with modern look
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: onCartTap,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Badge(
                  isLabelVisible: true, // ← show if you have cart items count
                  // smallLabel: const Text('3'), // uncomment + use real count
                  backgroundColor: AppTheme.primaryColor,
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 28,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}