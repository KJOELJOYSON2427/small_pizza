import 'package:flutter/material.dart';
import 'package:small_pizza/config/theme/app_theme.dart';
import 'package:small_pizza/features/restaurent/domain/entities/restaurant_entity.dart';
import 'package:small_pizza/features/restaurent/domain/enums/restaurant_status.dart';

class PopularRestaurantCard extends StatelessWidget {
  final RestaurantEntity restaurant;

  const PopularRestaurantCard({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // TODO: Navigate to restaurant detail screen
            // context.go('/home/restaurant/${restaurant.id}');
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image with overlay + status badge
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        restaurant.imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey.shade200,
                          child: const Icon(Icons.restaurant, color: Colors.grey),
                        ),
                      ),
                    ),

                    // Status badge (open/closed)
                    if (restaurant.status == RestaurantStatus.open)
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.shade700,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'OPEN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              restaurant.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.2,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (restaurant.isPopular)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppTheme.primaryColor.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'Popular',
                                style: TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      ),

                      const SizedBox(height: 4),

                      Text(
                        restaurant.category.name,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 13,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [
                          // Rating
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.amber.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.star_rounded, size: 16, color: Colors.amber),
                                const SizedBox(width: 4),
                                Text(
                                  restaurant.rating.toStringAsFixed(1),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 12),

                          // Rating count
                          Text(
                            '(${restaurant.ratingCount} ratings)',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),

                      if (restaurant.mostOrderedCount! > 0) ...[
                        const SizedBox(height: 6),
                        Text(
                          '${restaurant.mostOrderedCount}+ orders this week',
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ],
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