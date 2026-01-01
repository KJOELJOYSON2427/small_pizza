import 'package:equatable/equatable.dart';
import 'package:small_pizza/features/restaurent/domain/entities/restaurant_entity.dart';

abstract class PopularRestaurantsState extends Equatable {
  const PopularRestaurantsState();

  @override
  List<Object?> get props => [];
}

///intialization State
class PopularRestaurantsInitial extends PopularRestaurantsState {}

///Loader state
class PopularRestaurantsLoading extends PopularRestaurantsState {}


///This the data from tha api state
class PopularRestaurantsLoaded extends PopularRestaurantsState {
  final List<RestaurantEntity> restaurants;


  const PopularRestaurantsLoaded(this.restaurants);

  @override
  List<Object?> get props => [restaurants];
}



class PopularRestaurantsError extends PopularRestaurantsState {
  final String message;

  const PopularRestaurantsError(this.message);

  @override
  List<Object?> get props => [message];
}