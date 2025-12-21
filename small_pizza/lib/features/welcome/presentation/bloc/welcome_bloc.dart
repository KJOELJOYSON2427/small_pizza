import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_pizza/features/welcome/presentation/bloc/welcome_event.dart';
import 'package:small_pizza/features/welcome/presentation/bloc/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeInitial()) {
    on<LoginPressed>((event, emit) {});
     on<RegisterPressed>((event, emit) {});
  }
}
