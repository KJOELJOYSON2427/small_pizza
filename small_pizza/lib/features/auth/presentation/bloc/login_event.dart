import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();


  @override
  List<Object?> get props => [];

}

class LoginWithEmailRequested extends LoginEvent{
  final String email;
  final String password;

  const LoginWithEmailRequested(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}


class LoginWithGoogleRequested extends LoginEvent {}

class LoginWithFacebookRequested extends LoginEvent {}