class FoodModel {
  final String id;

  // Core info
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  // Stored as strings (API / Firebase friendly)
  final String cuisine;
  final String mealCategory;
  final String foodType;

  // Relation
  final String restaurantId;

  // Availability
  final bool isAvailable;

  // Ratings & popularity
  final double rating;
  final int ratingCount;
  final bool isPopular;

  // Offer fields (RAW)
  final String? offerType;        // percentage / flat / bogo
  final double? offerValue;       // percentage value or flat amount
  final DateTime? offerValidTill;

  // Meta
  final int displayOrder;
  final DateTime createdAt;

  const FoodModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.cuisine,
    required this.mealCategory,
    required this.foodType,
    required this.restaurantId,
    required this.isAvailable,
    required this.rating,
    required this.ratingCount,
    required this.isPopular,
    required this.displayOrder,
    required this.createdAt,
    this.offerType,
    this.offerValue,
    this.offerValidTill,
  });
}
