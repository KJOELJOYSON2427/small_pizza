// food_mapper.dart

import 'package:small_pizza/features/food/domain/entities/food_item_entity.dart';
import 'package:small_pizza/features/food/domain/enums/food_type.dart';
import 'package:small_pizza/features/restaurent/domain/enums/cuisine_variety.dart';

import '../models/food_model.dart';

class FoodMapper {
  static FoodEntity toEntity(FoodModel model) {
    print(model.createdAt);
    return FoodEntity(
      id: model.id,
      name: model.name,
      description: model.description,
      imageUrl: model.imageUrl,
      price: model.price,
      cuisine: Cuisine.values.firstWhere((e) => e.name == model.cuisine),
      foodType: FoodType.values.firstWhere((e) => e.name == model.foodType),
      restaurantId: model.restaurantId,
      restaurantName: model.restaurantName,
      rating: model.rating,
      ratingCount: model.ratingCount,
      isPopular: model.isPopular,
      createdAt: model.createdAt,
    );
  }
}
