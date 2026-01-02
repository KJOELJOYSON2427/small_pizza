import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:small_pizza/config/theme/app_theme.dart';

class PopularRestaurantsHeader extends StatelessWidget {
  const PopularRestaurantsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Popular Restaurants',
            
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),

          TextButton(
            onPressed: () {
              // Navigate to full list later
context.go('/home/popular-restaurants');
          },
            child: const Text(
              'View all',
              style: TextStyle(color: AppTheme.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
