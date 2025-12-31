import 'restaurant_entity.dart';
import 'restaurant_location_entity.dart';
import 'delivery_info_entity.dart';
import 'dietary_info_entity.dart';

class RestaurantDetailsEntity {
  final RestaurantEntity restaurant;
  final RestaurantLocationEntity location;
  final DeliveryInfoEntity deliveryInfo;
  final DietaryInfoEntity dietaryInfo;
  

  const RestaurantDetailsEntity({
    required this.restaurant,
    required this.location,
    required this.deliveryInfo,
    required this.dietaryInfo,
  });
}
