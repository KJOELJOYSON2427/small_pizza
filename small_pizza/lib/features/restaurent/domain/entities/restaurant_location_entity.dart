import 'address_entity.dart';

class RestaurantLocationEntity {
  final AddressEntity address;
  final double distanceKm;

  const RestaurantLocationEntity({
    required this.address,
    required this.distanceKm,
  });
}
