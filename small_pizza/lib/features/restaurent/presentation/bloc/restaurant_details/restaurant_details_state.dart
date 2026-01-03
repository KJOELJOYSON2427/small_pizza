import 'package:small_pizza/features/restaurent/domain/entities/restaurant_details_entity.dart';

class RestaurantDetailsState {
  final bool isLoading;
  final RestaurantDetailsEntity? details;
  final String? error;

 const RestaurantDetailsState({
    this.isLoading = false,
    this.details,
    this.error,
  });

   RestaurantDetailsState copyWith({
    bool? isLoading,
    RestaurantDetailsEntity? details,
    String? error,
  }) {
    return RestaurantDetailsState(
      isLoading: isLoading ?? this.isLoading,
      details: details ?? this.details,
      error: error,
    );
  }
}
