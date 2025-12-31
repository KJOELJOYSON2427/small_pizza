import 'package:equatable/equatable.dart';
import 'package:small_pizza/features/restaurent/domain/enums/cuisine_variety.dart';
import 'package:small_pizza/features/restaurent/domain/enums/restaurant_category.dart';
import 'package:small_pizza/features/restaurent/domain/enums/restaurant_status.dart';

class RestaurantEntity extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final int ratingCount;
  final RestaurantStatus status;
  final RestaurantCategory category;
final List<Cuisine> cuisines;

  // ── New recommended fields ───────────────────────────────
  final bool isPopular;          // true if restaurant is in "trending/popular" list
  final int? mostOrderedCount;   // number of orders (last 7/30 days) - nullable if not tracked
  final DateTime? recentlyPlaced; // last time THIS USER ordered from this restaurant (for personalization)

  const RestaurantEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.ratingCount,
    required this.status,
    required this.category,
    required this.cuisines,
    // New fields - you can make them required or optional depending on your needs
    this.isPopular = false,               // default: not popular
    this.mostOrderedCount,               // nullable - only set for top ordered ones
    this.recentlyPlaced,   
                   // nullable - only set if user has ordered before
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        rating,
        ratingCount,
        status,
        category,
        isPopular,
        mostOrderedCount,
        recentlyPlaced,
        cuisines
      ];
}