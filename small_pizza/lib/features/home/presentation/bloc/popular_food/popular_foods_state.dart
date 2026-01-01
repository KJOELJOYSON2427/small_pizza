import 'package:equatable/equatable.dart';
import 'package:small_pizza/features/food/domain/entities/food_item_entity.dart';

abstract class PopularFoodsState extends Equatable {
  const PopularFoodsState();
  @override
  List<Object?> get props => [];
}

class PopularFoodsInitial extends PopularFoodsState {}

class PopularFoodsLoading extends PopularFoodsState {}

class PopularFoodsLoaded extends PopularFoodsState {
  final List<FoodEntity> foods;

  const PopularFoodsLoaded(this.foods);

  @override
  List<Object?> get props => [foods];
}

class PopularFoodsError extends PopularFoodsState {
  final String message;

  const PopularFoodsError(this.message);
  @override
  List<Object?> get props => [message];
}
