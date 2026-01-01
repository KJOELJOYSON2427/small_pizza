import 'package:flutter/material.dart';
import 'package:small_pizza/config/theme/app_theme.dart';
import 'package:small_pizza/features/food/domain/entities/food_item_entity.dart';

class PopularFoodCard extends StatelessWidget {
  final FoodEntity food;

  const PopularFoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              food.imageUrl,
              height: 120,
              width: 170,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 8),

          // Name
          Text(
            food.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 4),

          // Cuisine + Rating
          Row(
            children: [
               Text(
                food.foodType.name,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
               ),
              Text(
                food.cuisine.name,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 6),
              const Icon(Icons.star, size: 14, color: AppTheme.primaryColor),
              const SizedBox(width: 2),
              Text(
                food.rating.toString(),
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
