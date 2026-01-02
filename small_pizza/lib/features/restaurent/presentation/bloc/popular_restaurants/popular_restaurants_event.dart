import 'package:equatable/equatable.dart';

abstract class PopularRestaurantsEvent extends Equatable {
  const PopularRestaurantsEvent();

  @override
  List<Object?> get props => [];
}

class LoadPopularRestaurants extends PopularRestaurantsEvent {}

class LoadMorePopularRestaurants extends PopularRestaurantsEvent {}
