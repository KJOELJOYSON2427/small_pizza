import 'restaurant_model.dart';
import 'restaurant_location_model.dart';
import 'delivery_info_model.dart';
import 'dietary_info_model.dart';

class RestaurantDetailsModel {
  final RestaurantModel restaurant;
  final RestaurantLocationModel location;
  final DeliveryInfoModel deliveryInfo;
  final DietaryInfoModel dietaryInfo;

  RestaurantDetailsModel({
    required this.restaurant,
    required this.location,
    required this.deliveryInfo,
    required this.dietaryInfo,
  });
}
