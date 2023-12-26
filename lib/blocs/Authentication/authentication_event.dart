part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AuthenticationUserChanged extends AuthenticationEvent {
  final User? user;
  AuthenticationUserChanged(this.user);
}

class SignInWithGoogleEvent extends AuthenticationEvent {}

class SignInWithEmailAndPasswordEvent extends AuthenticationEvent {
  final String email;
  final String password;

  SignInWithEmailAndPasswordEvent(
      {required this.email, required this.password});
}

class SignOutEvent extends AuthenticationEvent {}
