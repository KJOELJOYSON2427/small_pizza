import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_pizza/features/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:small_pizza/features/auth/domain/usecases/login_with_facebook_usecase.dart';
import 'package:small_pizza/features/auth/domain/usecases/login_with_google_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginWithEmailUseCase loginWithEmail;
  final LoginWithGoogleUseCase loginWithGoogle;
  final LoginWithFacebookUseCase loginWithFacebook;

  LoginBloc({required this.loginWithEmail,
    required this.loginWithGoogle,
    required this.loginWithFacebook,}) : super(LoginInitial()) {
    on<LoginWithEmailRequested>(_onEmailLogin);
    on<LoginWithGoogleRequested>(_onGoogleLogin);
    on<LoginWithFacebookRequested>(_onFacebookLogin);
  }

 Future<void> _onEmailLogin(
    LoginWithEmailRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final user = await loginWithEmail.call(
        email:event.email,
        password:event.password,
      );
      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  Future<void> _onGoogleLogin(
    LoginWithGoogleRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final user = await loginWithGoogle.call();
      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  Future<void> _onFacebookLogin(
    LoginWithFacebookRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final user = await loginWithFacebook.call();
      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
