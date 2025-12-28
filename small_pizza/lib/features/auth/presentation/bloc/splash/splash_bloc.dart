// splash_bloc.dart
import 'dart:async';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_pizza/features/auth/domain/usecases/auth_state_changes_usecase.dart';
import "../../../domain/entities/user_entity.dart";
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthStateChangesUseCase _authStateChangesUseCase;

  StreamSubscription<UserEntity?>? _authSubscription;

  SplashBloc({required AuthStateChangesUseCase authStateChangesUseCase})
    : _authStateChangesUseCase = authStateChangesUseCase,
      super(const SplashState.initial()) {
    on<SplashStarted>(_onSplashStarted);
  }

  Future<void> _onSplashStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    // 1. Show loading/splash immediately
    emit(const SplashState.loading());
    // 2. Listen to auth state changes
    _authSubscription?.cancel();
    _authSubscription = _authStateChangesUseCase.call().listen((user) {

      if(user != null){
        // User is logged in → go to home/main screen
        emit(SplashState.authenticated(user));
      }else{
        // No user → go to login/onboarding
        emit(const SplashState.unauthenticated());
      }
    });

    
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
