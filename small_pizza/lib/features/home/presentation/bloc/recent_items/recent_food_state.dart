import 'package:equatable/equatable.dart';
import 'package:small_pizza/features/food/domain/entities/food_item_entity.dart';

abstract class RecentFoodsState extends Equatable {
  const RecentFoodsState();
  @override
  List<Object?> get props => [];
}

class RecentFoodsInitial extends RecentFoodsState {

  
}

class RecentFoodsLoading extends RecentFoodsState {}

class RecentFoodsLoaded extends RecentFoodsState {
  final List<FoodEntity> foods;

  const RecentFoodsLoaded(this.foods);

   @override
  List<Object?> get props => [foods];
}

class RecentFoodsError extends RecentFoodsState {
  final String message;

  const RecentFoodsError(this.message);
   @override
  List<Object?> get props => [message];
}
