part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

class UserLoggedState extends AuthenticationState {
  final String message;

  UserLoggedState({required this.message});
}

class UserNotLoggedState extends AuthenticationState {}

class AuthenticationErrorState extends AuthenticationState {
  final String error;

  AuthenticationErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}
