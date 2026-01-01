import 'package:equatable/equatable.dart';

abstract class PopularFoodsEvent extends Equatable {
  const PopularFoodsEvent();
  @override
  List<Object?> get props => [];
}

class LoadPopularFoods extends PopularFoodsEvent {}
