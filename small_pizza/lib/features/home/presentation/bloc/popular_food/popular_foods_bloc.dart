import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_pizza/features/food/domain/usecases/get_popular_foods.dart';
import 'package:small_pizza/features/home/presentation/bloc/popular_food/popular_foods_event.dart';
import 'package:small_pizza/features/home/presentation/bloc/popular_food/popular_foods_state.dart';

class PopularFoodsBloc
    extends Bloc<PopularFoodsEvent, PopularFoodsState> {
  final GetPopularFoodsUseCase getPopularFoods;

  PopularFoodsBloc(this.getPopularFoods)
      : super(PopularFoodsInitial()) {
    on<LoadPopularFoods>(_onLoadPopularFoods);
  }

  Future<void> _onLoadPopularFoods(
    LoadPopularFoods event,
    Emitter<PopularFoodsState> emit,
  ) async {
    emit(PopularFoodsLoading());

    try {
      final foods = await getPopularFoods();
      emit(PopularFoodsLoaded(foods));
    } catch (e) {
      emit(PopularFoodsError('Failed to load popular foods'));
    }
  }
}
