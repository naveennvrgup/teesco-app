part of 'user_registration_bloc.dart';

abstract class UserRegistrationState extends Equatable {
  const UserRegistrationState();
}

class UserRegistrationInitial extends UserRegistrationState {
  @override
  List<Object> get props => [];
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

class VisitLoginScreenState extends UserRegistrationState {
  @override
  List<Object> get props => [];
}
