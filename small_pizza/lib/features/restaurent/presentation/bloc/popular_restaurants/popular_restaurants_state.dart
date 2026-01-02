import 'package:equatable/equatable.dart';
import '../../../domain/entities/restaurant_entity.dart';

class PopularRestaurantsState extends Equatable {
  final List<RestaurantEntity> restaurants;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasReachedMax;



  const PopularRestaurantsState({
    this.restaurants = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasReachedMax = false,
  });

  PopularRestaurantsState copyWith({
    List<RestaurantEntity>? restaurants,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasReachedMax,
  }) {
    return PopularRestaurantsState(
      restaurants: restaurants ?? this.restaurants,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props =>
      [restaurants, isLoading, isLoadingMore, hasReachedMax];

}
