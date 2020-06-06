part of 'user_registration_bloc.dart';

abstract class UserRegistrationEvent extends Equatable {
  const UserRegistrationEvent();
}

class RegisterUser extends UserRegistrationEvent {
  final dynamic payload;

  RegisterUser(this.payload);

  @override
  List<Object> get props => [payload];
}

class VisitLoginScreen extends UserRegistrationEvent {
  const VisitLoginScreen();
  @override
  List<Object> get props => [];
}