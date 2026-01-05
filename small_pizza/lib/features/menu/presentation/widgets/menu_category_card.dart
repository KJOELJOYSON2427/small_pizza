import 'package:flutter/material.dart';
import 'package:small_pizza/config/theme/app_theme.dart';
import 'package:small_pizza/features/food/domain/enums/menu_category.dart';

class MenuCategoryCard extends StatelessWidget {
  final MealCategory category;
  final int count;
  final VoidCallback? onTap;

  const MenuCategoryCard({
    super.key,
    required this.category,
    required this.count,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 90,
        child: Stack(
          clipBehavior: Clip.none, // 👈 allows image overflow
          children: [
            // Card
            Positioned.fill(
              left: 24, // space for overlapping image
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.elliptical(60, 80), // 👈 curve
                    right: Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(isDark ? 0.25 : 0.08),
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 36), // space for image
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _getDisplayName(category),
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$count items',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: theme.colorScheme.onSurfaceVariant,
                      size: 26,
                    ),
                  ],
                ),
              ),
            ),

            // Overlapping Image
            Positioned(
              left: 0,
              top: 14,
              bottom: 14,
              child: _buildCategoryVisual(category),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildCategoryVisual(MealCategory category) {
  return Container(
    width: 64,
    height: 64,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
        ),
      ],
    ),
    child: ClipOval(
      child: Image.asset(
        _imageForCategory(category),
        fit: BoxFit.cover,
        width: 48,
        height: 48,
      ),
    ),
  );
}

String _imageForCategory(MealCategory category) {
  return switch (category) {
    MealCategory.lunch => 'assets/img/menu_1.png',
    MealCategory.beverages => 'assets/img/menu_2.png',
    MealCategory.desserts => 'assets/img/menu_3.png',
    MealCategory.dinner => 'assets/img/menu_4.png',
    _ => 'assets/img/menu_1.png',
  };
}


  String _getDisplayName(MealCategory category) {
    return switch (category) {
      MealCategory.breakfast => 'Breakfast',
      MealCategory.lunch => 'Lunch',
      MealCategory.dinner => 'Dinner',
      MealCategory.snacks => 'Snacks & Sides',
      MealCategory.beverages => 'Drinks',
      MealCategory.desserts => 'Desserts',
    };
  }

  IconData _iconForCategory(MealCategory category) {
    return switch (category) {
      MealCategory.breakfast => Icons.free_breakfast_rounded,
      MealCategory.lunch => Icons.lunch_dining_rounded,
      MealCategory.dinner => Icons.dinner_dining_rounded,
      MealCategory.snacks => Icons.fastfood_rounded,
      MealCategory.beverages => Icons.local_cafe_rounded,
      MealCategory.desserts => Icons.icecream_rounded,
    };
  }
