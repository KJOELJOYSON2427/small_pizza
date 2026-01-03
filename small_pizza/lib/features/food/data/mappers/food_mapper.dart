import 'package:small_pizza/features/food/domain/entities/food_item_entity.dart';
import 'package:small_pizza/features/food/domain/entities/food_offer.dart';
import 'package:small_pizza/features/food/domain/extensions/cuisine_extension.dart';
import 'package:small_pizza/features/food/domain/extensions/food_type_extension.dart';
import 'package:small_pizza/features/food/domain/extensions/meal_category_extension.dart';
import 'package:small_pizza/features/food/domain/extensions/offer_type_extension.dart';



import '../models/food_model.dart';


class FoodMapper {
  static FoodEntity toEntity(FoodModel model) {
    return FoodEntity(
      id: model.id,
      name: model.name,
      description: model.description,
      imageUrl: model.imageUrl,
      price: model.price,

      cuisine: model.cuisine.toCuisine(),
      foodType: model.foodType.toFoodType(),
      mealCategory: model.mealCategory.toMealCategory(),

      restaurantId: model.restaurantId,

      isAvailable: model.isAvailable,

      rating: model.rating,
      ratingCount: model.ratingCount,
      isPopular: model.isPopular,

      offer: _mapOffer(model),

      displayOrder: model.displayOrder,
      createdAt: model.createdAt,
    );
  }

  static FoodOfferEntity? _mapOffer(FoodModel model) {
    if (model.offerType == null) return null;

    return FoodOfferEntity(
      type: model.offerType!.toOfferType(),
      value: model.offerValue,
      validTill: model.offerValidTill,
    );
  }
}
