import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_pizza/features/restaurent/domain/usecases/get_popular_restaurants_with_page.dart';
import 'popular_restaurants_event.dart';
import 'popular_restaurants_state.dart';
import '../../../domain/usecases/get_popular_restaurants_usecase.dart';

class PopularRestaurantsWithPageBloc
    extends Bloc<PopularRestaurantsEvent, PopularRestaurantsState> {
  final GetPopularRestaurantsWithPageUseCase useCase;

  int _page = 1;

  PopularRestaurantsWithPageBloc(this.useCase)
    : super(const PopularRestaurantsState()) {
    on<LoadPopularRestaurants>(_onLoad);
    on<LoadMorePopularRestaurants>(_onLoadMore);
  }

  Future<void> _onLoad(
    LoadPopularRestaurants event,
    Emitter<PopularRestaurantsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    _page = 1;
    final restaurants = await useCase.call(page: _page);

    emit(
      state.copyWith(
        restaurants: restaurants,
        isLoading: false,
        hasReachedMax: restaurants.isEmpty,
      ),
    );
  }

  Future<void> _onLoadMore(
    LoadMorePopularRestaurants event,
    Emitter<PopularRestaurantsState> emit,
  ) async {
    if (state.hasReachedMax || state.isLoadingMore) return;

    emit(state.copyWith(isLoadingMore: true));
    _page++;

    final more = await useCase(page: _page);

    emit(state.copyWith(
      restaurants: [...state.restaurants, ...more],
      isLoadingMore: false,
      hasReachedMax: more.isEmpty
    ));
  }
}
