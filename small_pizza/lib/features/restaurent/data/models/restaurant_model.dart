
// restaurant_model.dart
class RestaurantModel {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final int ratingCount;
  final String status;
  final String category;
  final List<String> cuisines;

  final bool isPopular;
  final int? mostOrderedCount;
  final DateTime? recentlyPlaced;

  const RestaurantModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.ratingCount,
    required this.status,
    required this.category,
    required this.cuisines,
    this.isPopular = false,
    this.mostOrderedCount,
    this.recentlyPlaced,
  });
}
