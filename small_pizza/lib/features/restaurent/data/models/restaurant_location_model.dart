import 'address_model.dart';

class RestaurantLocationModel {
  final AddressModel address;
  final double distanceKm;

  RestaurantLocationModel({
    required this.address,
    required this.distanceKm,
  });
}
