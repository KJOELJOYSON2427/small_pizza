import 'package:small_pizza/features/food/domain/enums/food_type.dart';
import 'package:small_pizza/features/restaurent/data/models/restaurant_details_model.dart';
import 'package:small_pizza/features/restaurent/domain/entities/address_entity.dart';
import 'package:small_pizza/features/restaurent/domain/entities/delivery_info_entity.dart';
import 'package:small_pizza/features/restaurent/domain/entities/dietary_info_entity.dart';
import 'package:small_pizza/features/restaurent/domain/entities/restaurant_details_entity.dart';
import 'package:small_pizza/features/restaurent/domain/entities/restaurant_entity.dart';
import 'package:small_pizza/features/restaurent/domain/entities/restaurant_location_entity.dart';
import 'package:small_pizza/features/restaurent/domain/enums/cuisine_variety.dart';
import 'package:small_pizza/features/restaurent/domain/enums/restaurant_category.dart';
import 'package:small_pizza/features/restaurent/domain/enums/restaurant_status.dart';

class RestaurantDetailsMapper {
  static RestaurantDetailsEntity toEntity(RestaurantDetailsModel model) {
    return RestaurantDetailsEntity(
      restaurant: RestaurantEntity(
        id: model.restaurant.id,
        name: model.restaurant.name ?? 'Unknown Restaurant',
        imageUrl: model.restaurant.imageUrl ?? '',
        rating: model.restaurant.rating ?? 0.0,
        ratingCount: model.restaurant.ratingCount ?? 0,
        status: _safeEnum(
          RestaurantStatus.values,
          model.restaurant.status,
          RestaurantStatus.closed,
        ),
        category: _safeEnum(
          RestaurantCategory.values,
          model.restaurant.category,
          RestaurantCategory.streetFood,
        ),
        cuisines: model.restaurant.cuisines
            .map((c) => _safeEnum(Cuisine.values, c, Cuisine.mexican))
            .whereType<Cuisine>()
            .toList(),
      ),
      location: RestaurantLocationEntity(
        address: AddressEntity(
          street: model.location?.address?.street ?? '',
          area: model.location?.address?.area ?? '',
          city: model.location?.address?.city ?? '',
          pincode: model.location?.address?.pincode ?? '',
          latitude: double.tryParse(model.location?.address?.latitude?.toString() ?? '0.0') ?? 0.0,
          longitude: double.tryParse(model.location?.address?.longitude?.toString() ?? '0.0') ?? 0.0,
        ),
        distanceKm: model.location?.distanceKm ?? 0.0,
      ),
      deliveryInfo: DeliveryInfoEntity(
        minDeliveryTime: model.deliveryInfo?.minDeliveryTime ?? 0,
        maxDeliveryTime: model.deliveryInfo?.maxDeliveryTime ?? 0,
        deliveryFee: model.deliveryInfo?.deliveryFee ?? 0.0,
      ),
      dietaryInfo: DietaryInfoEntity(
        supportedFoodTypes: model.dietaryInfo?.supportedFoodTypes
                ?.map((e) => _safeEnum(FoodType.values, e, FoodType.veg))
                .whereType<FoodType>()
                .toSet() ??
            {},
      ),
    );
  }

  static T _safeEnum<T extends Enum>(List<T> values, String? name, T fallback) {
    if (name == null) return fallback;
    try {
      return values.firstWhere((e) => e.name == name);
    } catch (_) {
      print('⚠️ Enum mapping failed: $name not found in $T. Using fallback: ${fallback.name}');
      return fallback;
    }
  }
}