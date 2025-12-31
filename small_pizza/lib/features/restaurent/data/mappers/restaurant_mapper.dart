// restaurant_mapper.dart
import '../../domain/entities/restaurant_entity.dart';
import '../../domain/enums/cuisine_variety.dart';
import '../../domain/enums/restaurant_category.dart';
import '../../domain/enums/restaurant_status.dart';
import '../models/restaurant_model.dart';

class RestaurantMapper {
  static RestaurantEntity toEntity(RestaurantModel model) {
    return RestaurantEntity(
      id: model.id,
      name: model.name,
      imageUrl: model.imageUrl,
      rating: model.rating,
      ratingCount: model.ratingCount,
      status: RestaurantStatus.values.firstWhere((e) => e.name == model.status),
      category: RestaurantCategory.values.firstWhere(
        (e) => e.name == model.category,
      ),
      cuisines: model.cuisines
          .map((c) => Cuisine.values.firstWhere((e) => e.name == c))
          .toList(),

          isPopular: model.isPopular,
      mostOrderedCount: model.mostOrderedCount,
      recentlyPlaced: model.recentlyPlaced,
    );
  }
}
