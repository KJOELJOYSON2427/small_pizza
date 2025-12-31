import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_header_event.dart';
import 'home_header_state.dart';

class HomeHeaderBloc extends Bloc<HomeHeaderEvent, HomeHeaderState> {
  HomeHeaderBloc()
      : super(HomeHeaderState.initial()) {
    on<LoadHomeHeader>(_onLoad);
    on<LocationTappedEvent>(_onLocationTapped);
    on<LocationSelectedEvent>(_onLocationSelected);
  }

  void _onLoad(LoadHomeHeader event, Emitter<HomeHeaderState> emit) {
    // Future: load real user data / saved location
    emit(state);
  }

  void _onLocationTapped(
    LocationTappedEvent event,
    Emitter<HomeHeaderState> emit,
  ) {
    emit(state.copyWith(openLocationSheet: true));
  }

  void _onLocationSelected(
    LocationSelectedEvent event,
    Emitter<HomeHeaderState> emit,
  ) {
    emit(state.copyWith(
      locationName: event.location,
      openLocationSheet: false,
    ));
  }
}