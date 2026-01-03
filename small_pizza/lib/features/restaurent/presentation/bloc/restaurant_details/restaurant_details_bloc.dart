import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_pizza/features/restaurent/domain/usecases/get_restaurant_details_usecase.dart';
import 'package:small_pizza/features/restaurent/presentation/bloc/restaurant_details/restaurant_details_event.dart';
import 'package:small_pizza/features/restaurent/presentation/bloc/restaurant_details/restaurant_details_state.dart';

class RestaurantDetailsBloc
    extends Bloc<RestaurantDetailsEvent, RestaurantDetailsState> {
  final GetRestaurantDetailsUseCase getRestaurantDetails;

  RestaurantDetailsBloc(this.getRestaurantDetails)
    : super(const RestaurantDetailsState()) {
    on<LoadRestaurantDetails>(_onLoadRestaurantDetails);
  }

  Future<void> _onLoadRestaurantDetails(
    LoadRestaurantDetails event,
    Emitter<RestaurantDetailsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final details = await getRestaurantDetails.call(event.restaurantId);

      emit(state.copyWith(isLoading: false, details: details));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
