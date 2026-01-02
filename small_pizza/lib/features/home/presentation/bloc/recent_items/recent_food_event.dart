import 'package:equatable/equatable.dart';

abstract class RecentFoodsEvent extends Equatable {
  const RecentFoodsEvent();
  @override
  List<Object?> get props => [];
}

class LoadRecentFoods extends RecentFoodsEvent {
  @override
  List<Object?> get props => [];
}
