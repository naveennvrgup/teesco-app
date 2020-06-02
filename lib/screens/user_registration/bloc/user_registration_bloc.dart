import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teesco/core/res/errors.dart';
import 'package:teesco/models/user_registration_model.dart';
import 'package:teesco/screens/user_registration/user_registration_repository.dart';

part 'user_registration_event.dart';
part 'user_registration_state.dart';

class UserRegistrationBloc
    extends Bloc<UserRegistrationEvent, UserRegistrationState> {
  final UserRegistrationRepository userRegistrationRepository;

  UserRegistrationBloc(this.userRegistrationRepository);

  @override
  UserRegistrationState get initialState => UserRegistrationInitial();

  @override
  Stream<UserRegistrationState> mapEventToState(
    UserRegistrationEvent event,
  ) async* {
    yield UserRegistrationLoading();
    if (event is RegisterUser) {
      try {
        await userRegistrationRepository.registerUser(
            UserRegistrationModel(
                name: '', email: '', password: '', institution: ''));
        yield UserRegistrationInitial();
      } catch (e) {
        if(e is InvalidInputError){
          print(e.details);
        }
      } 
    }
  }
}
