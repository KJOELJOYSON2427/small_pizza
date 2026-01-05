import 'package:flutter/material.dart';
import 'package:small_pizza/features/food/domain/entities/food_item_entity.dart';

class FoodCard extends StatelessWidget {
  final FoodEntity food;

  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(food.imageUrl, height: 160, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(food.name,
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.orange),
                    Text(food.rating.toString()),
                    const Spacer(),
                    Text('₹${food.price}'),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),

        /// OFFER BADGE
        if (food.offer != null)
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${food.offer!.value}% OFF',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
