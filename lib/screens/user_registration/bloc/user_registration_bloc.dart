import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teesco/core/res/errors.dart';
import 'package:teesco/screens/login/bloc/login_bloc.dart';
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

    // if the user wants to go to login screen
    if (event is VisitLoginScreen) {
      print("vis login ");
      yield VisitLoginScreenState();
    }

    // to make the register API call
    if (event is RegisterUser) {
      try {
        await userRegistrationRepository.registerUser(event.payload);
        // upon success
        yield UserRegistrationSuccess();
      } catch (e) {
        // upon error
        if (e is InvalidFormInputError) {
          yield UserRegistrationError(e.errorDetail);
        }
      }
    }
  }
}
