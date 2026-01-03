import 'package:flutter/material.dart';
import 'package:small_pizza/config/theme/app_theme.dart';
import 'package:small_pizza/features/restaurent/domain/entities/restaurant_entity.dart';

class PopularRestaurantCard extends StatelessWidget {
  final RestaurantEntity restaurant;
  final VoidCallback? onTap;

  const PopularRestaurantCard({super.key, required this.restaurant, this.onTap,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      
          children: [
            //Image
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                restaurant.imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
             const SizedBox(height: 8),
      
            // Name
            Text(
              restaurant.name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
      
            const SizedBox(height: 4),
             // Rating + category
             Row(
              children: [
                const Icon(Icons.star, size: 14, color: Colors.orange),
                const SizedBox(width: 4),
                 Text(
                  '${restaurant.rating}',
                  style:  TextStyle(fontWeight: FontWeight.w600, color: AppTheme.primaryColor),
                ),
                const SizedBox(width: 4),
                Text(
                  '(${restaurant.ratingCount} ratings)',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
                const SizedBox(width: 8),
                Text(
                  restaurant.category.name,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
             )
          ],
        ),
      ),
    );
  }
}
