


import 'package:flutter/material.dart';
import 'package:small_pizza/features/food/domain/entities/food_item_entity.dart';

class RecentFoodTile extends StatelessWidget {
  final FoodEntity food;

  const RecentFoodTile({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            food.imageUrl,
            width: 64,
            height: 64,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(width: 12),

        // Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${food.restaurantName} • ${food.cuisine.name}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 14,
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${food.rating} (${food.ratingCount} Ratings)',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
