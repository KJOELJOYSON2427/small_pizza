// restaurant_mapper.dart
import '../../domain/entities/restaurant_entity.dart';
import '../../domain/enums/cuisine_variety.dart';
import '../../domain/enums/restaurant_category.dart';
import '../../domain/enums/restaurant_status.dart';
import '../models/restaurant_model.dart';

class RestaurantMapper {
  static RestaurantEntity toEntity(RestaurantModel model) {
  
  try {
    final statusEnum = RestaurantStatus.values.firstWhere(
      (e) => e.name == model.status,
      orElse: () => throw Exception('Unknown status: ${model.status}'),
    );
    print('║ Status enum found   : $statusEnum');
  } catch (e) {
    
    rethrow;
  }

  try {
    final categoryEnum = RestaurantCategory.values.firstWhere(
      (e) => e.name == model.category,
      orElse: () => throw Exception('Unknown category: ${model.category}'),
    );
    print('║ Category enum found : $categoryEnum');
  } catch (e) {
   
    rethrow;
  }

  List<Cuisine> cuisinesEnum = [];
  try {
    cuisinesEnum = model.cuisines
        .map((c) {
          final enumValue = Cuisine.values.firstWhere(
            (e) => e.name == c,
            orElse: () => throw Exception('Unknown cuisine: $c'),
          );
          return enumValue;
        })
        .toList();
  } catch (e) {
   
    rethrow;
  }

  final entity = RestaurantEntity(
    id: model.id,
    name: model.name,
    imageUrl: model.imageUrl,
    rating: model.rating,
    ratingCount: model.ratingCount,
    status: RestaurantStatus.values.firstWhere((e) => e.name == model.status),
    category: RestaurantCategory.values.firstWhere((e) => e.name == model.category),
    cuisines: cuisinesEnum,
    isPopular: model.isPopular,
    mostOrderedCount: model.mostOrderedCount,
    recentlyPlaced: model.recentlyPlaced,
  );

  return entity;
}
}
