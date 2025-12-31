import 'package:small_pizza/features/restaurent/domain/enums/cuisine_variety.dart';

import '../enums/food_type.dart';

class FoodEntity {
  final String id;

  // Food info
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  // Classification
  final Cuisine cuisine;
  final FoodType foodType;

  // Restaurant relation
  final String restaurantId;
  final String restaurantName;

  // Ratings & popularity
  final double rating;
  final int ratingCount;
  final bool isPopular;

  // Meta
  final DateTime createdAt;

  const FoodEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.cuisine,
    required this.foodType,
    required this.restaurantId,
    required this.restaurantName,
    required this.rating,
    required this.ratingCount,
    required this.isPopular,
    required this.createdAt,
  });
}
