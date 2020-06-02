part of 'user_registration_bloc.dart';

abstract class UserRegistrationEvent extends Equatable {
  const UserRegistrationEvent();
}

class RegisterUser extends UserRegistrationEvent {
  final UserRegistrationModel userRegistrationModel;

  RegisterUser(this.userRegistrationModel);

  @override
  List<Object> get props => [userRegistrationModel];
}

class VisitLoginScreen extends UserRegistrationEvent {
  const VisitLoginScreen();
  @override
  List<Object> get props => [];
}

class FieldsUpdated extends UserRegistrationEvent {
  const FieldsUpdated();
  @override
  List<Object> get props => [];
}
