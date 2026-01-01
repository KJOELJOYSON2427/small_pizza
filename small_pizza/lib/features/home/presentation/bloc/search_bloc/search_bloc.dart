import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  SearchBloc(): super(const SearchState()){
    on<SearchTextChanged>(_onSearchTextChanged);
    on<SearchSubmitted>(_onSearchSubmitted);
  }

  void _onSearchTextChanged(
    SearchTextChanged event,
    Emitter<SearchState> emit,
  ){
      emit(state.copyWith(query: event.query));
  }

  void _onSearchSubmitted(
    SearchSubmitted event,
    Emitter<SearchState> emit,
  ) {
    emit(state.copyWith(
      query: event.query,
      isSubmitted: true,
    ));
  }
}
