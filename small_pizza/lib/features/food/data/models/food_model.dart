// food_model.dart
class FoodModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final String cuisine;
  final String foodType;
  final String restaurantId;
  final String restaurantName;
  final double rating;
  final int ratingCount;
  final bool isPopular;
  final DateTime createdAt;

  const FoodModel({
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
