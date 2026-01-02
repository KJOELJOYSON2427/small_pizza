import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_pizza/features/food/domain/usecases/get_recent_foods.dart';
import 'package:small_pizza/features/home/presentation/bloc/recent_items/recent_food_event.dart';
import 'package:small_pizza/features/home/presentation/bloc/recent_items/recent_food_state.dart';

class RecentFoodsBloc extends Bloc<RecentFoodsEvent, RecentFoodsState> {
  final GetRecentFoodsUseCase getRecentFoods;

  RecentFoodsBloc(this.getRecentFoods) : super(RecentFoodsInitial()) {
    on<LoadRecentFoods>(_onLoadRecentFoods);
  }

  Future<void> _onLoadRecentFoods(
    LoadRecentFoods event,
    Emitter<RecentFoodsState> emit,
  ) async {
    emit(RecentFoodsLoading());

    try {
      final foods = await getRecentFoods.call();
      print("caqme ${foods[0].createdAt}");
      // Sort by createdAt (latest first)
      foods.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      emit(RecentFoodsLoaded(foods));
    } catch (e) {
      emit(RecentFoodsError('Failed to load recent foods'));
    }
  }
}
