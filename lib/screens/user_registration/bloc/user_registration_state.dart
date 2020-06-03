part of 'user_registration_bloc.dart';

abstract class UserRegistrationState extends Equatable {
  const UserRegistrationState();
}

class UserRegistrationInitial extends UserRegistrationState {
  final bool visitSignupScreen;

  UserRegistrationInitial({this.visitSignupScreen: false});

  @override
  List<Object> get props => [visitSignupScreen];
}

class UserRegistrationLoading extends UserRegistrationState {
  @override
  List<Object> get props => [];
}


class UserRegistrationSuccess extends UserRegistrationState {
  @override
  List<Object> get props => [];
}


class UserRegistrationError extends UserRegistrationState {
  final Map<String,String> errors;

  UserRegistrationError(this.errors);

  @override
  List<Object> get props => [];
}