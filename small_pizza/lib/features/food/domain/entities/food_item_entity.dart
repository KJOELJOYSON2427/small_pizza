import 'package:equatable/equatable.dart';
import 'package:small_pizza/features/food/domain/entities/food_offer.dart';
import 'package:small_pizza/features/food/domain/enums/food_type.dart';
import 'package:small_pizza/features/food/domain/enums/menu_category.dart';
import 'package:small_pizza/features/restaurent/domain/enums/cuisine_variety.dart';


class FoodEntity extends Equatable {
  final String id;

  final String name;
  final String description;
  final String imageUrl;
  final double price;

  final Cuisine cuisine;
  final MealCategory mealCategory;
  final FoodType foodType;

  final String restaurantId;

  final bool isAvailable;

  final double rating;
  final int ratingCount;
  final bool isPopular;

  final FoodOfferEntity? offer;

  final int displayOrder;
  final DateTime createdAt;

  const FoodEntity({
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
    this.offer,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
