import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_pizza/features/food/domain/usecases/get_foods_by_restaurant.dart';
import 'package:small_pizza/features/restaurent/presentation/bloc/popular_foods_from_restaurant/popular_from_restaurant_event.dart';
import 'package:small_pizza/features/restaurent/presentation/bloc/popular_foods_from_restaurant/popular_from_restaurant_state.dart';

class PopularFromRestaurantBloc
    extends Bloc<PopularFromRestaurantEvent, PopularFromRestaurantState> {
  final GetFoodsByRestaurantUseCase getFoodsByRestaurant;

  PopularFromRestaurantBloc(this.getFoodsByRestaurant)
      : super(const PopularFromRestaurantState()) {
    on<LoadPopularFromRestaurant>(_onLoad);
  }

  Future<void> _onLoad(
    LoadPopularFromRestaurant event,
    Emitter<PopularFromRestaurantState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final foods = await getFoodsByRestaurant(event.restaurantId);

      emit(
        state.copyWith(
          isLoading: false,
          foods: foods.take(5).toList(), // 👈 preview limit
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
