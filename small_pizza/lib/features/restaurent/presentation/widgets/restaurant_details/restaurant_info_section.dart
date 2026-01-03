import 'package:flutter/material.dart';
import 'package:small_pizza/config/theme/app_theme.dart';
import '../../../domain/entities/restaurant_details_entity.dart';

class RestaurantInfoSection extends StatelessWidget {
  final RestaurantDetailsEntity details;

  const RestaurantInfoSection({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    final restaurant = details.restaurant;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star, color: AppTheme.primaryColor, size: 18),
              const SizedBox(width: 4),
              Text('${restaurant.rating}'),
              const SizedBox(width: 8),
              Text('(${restaurant.ratingCount} ratings)'),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '${details.location.address.area}, ${details.location.address.city}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
