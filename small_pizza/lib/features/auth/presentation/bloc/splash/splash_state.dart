// splash_state.dart
part of 'splash_bloc.dart';

class SplashState extends Equatable {
  final bool isLoading;

  final UserEntity? user;

  final bool isAuthenticated;

  const SplashState({
    required this.isLoading,
    this.user,
    required this.isAuthenticated,
  });

  const SplashState.initial() : this(isLoading: false, isAuthenticated: false);


  const SplashState.loading()
      : this(isLoading: true, isAuthenticated: false);

  
  const SplashState.authenticated(UserEntity user)
      : this(
          isLoading: false,
          user: user,
          isAuthenticated: true,
        );

 const SplashState.unauthenticated()
      : this(isLoading: false, isAuthenticated: false);


      @override
     List<Object?> get props => [isLoading, user, isAuthenticated];
}
