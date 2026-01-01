import 'package:flutter_bloc/flutter_bloc.dart';
import 'popular_restaurants_event.dart';
import 'popular_restaurants_state.dart';
import 'package:small_pizza/features/restaurent/domain/usecases/get_popular_restaurants_usecase.dart';

class PopularRestaurantsBloc
    extends Bloc<PopularRestaurantsEvent, PopularRestaurantsState> {
  final GetPopularRestaurantsUseCase getPopularRestaurants;

  PopularRestaurantsBloc(this.getPopularRestaurants)
    : super(PopularRestaurantsInitial()) {
    on<LoadPopularRestaurants>(_onLoad);
  }

  Future<void> _onLoad(
    LoadPopularRestaurants event,
    Emitter<PopularRestaurantsState> emit,
  ) async {
    emit(PopularRestaurantsLoading());
    try {
      final restaurants = await getPopularRestaurants.call();
      print(restaurants);
      emit(PopularRestaurantsLoaded(restaurants));
    } catch (e) {
      emit(PopularRestaurantsError(e.toString()));
    }
  }
}
