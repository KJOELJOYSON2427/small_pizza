import 'package:flutter/material.dart';
import 'package:small_pizza/features/food/domain/entities/food_item_entity.dart';

class FoodPreviewCard extends StatelessWidget {
  final FoodEntity food;

  const FoodPreviewCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              food.imageUrl,
              height: 120,
              width: 160,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            food.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            '₹${food.price}',
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
