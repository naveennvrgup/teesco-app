import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teesco/screens/login/login.dart';
import 'package:teesco/screens/login/widgets/password_field.dart';
import 'package:teesco/screens/user_registration/bloc/user_registration_bloc.dart';
import 'package:teesco/screens/user_registration/user_registration_repository.dart';
import 'package:teesco/screens/user_registration/widgets/confirm_password_field.dart';
import 'package:teesco/screens/user_registration/widgets/email_input.dart';
import 'package:teesco/screens/user_registration/widgets/full_name_field.dart';
import 'package:teesco/screens/user_registration/widgets/institute_name_field.dart';
import 'package:teesco/screens/user_registration/widgets/phone_number_field.dart';
import 'package:teesco/screens/user_registration/widgets/signup_button.dart';
import 'package:teesco/screens/user_registration/widgets/visit_login_text.dart';

class UserRegistration extends StatelessWidget {
  // Form key
  final _formKey = GlobalKey<FormState>();

  // TextEditing Controllers
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController instituteNameController = TextEditingController();

  Widget buildInitial(BuildContext context, {Map<String, String> errors}) {
    // assign an empty object if there are no errors
    errors ??= Map<String, String>();

    return Scaffold(
        body: SafeArea(
      child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: FullNameField(
                        fullNameController: fullNameController,
                        errorMsg: errors['name']),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: EmailField(
                      controller: emailController,
                      errorMsg: errors['email'],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: InstituteNameField(
                      controller: instituteNameController,
                      errorMsg: errors['institution'],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: PhoneNumberField(
                      controller: phoneNumberController,
                      errorMsg: errors['phone'],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: PasswordField(
                      controller: passwordController,
                      errorMsg: errors['password'],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ComnfirmPasswordField(
                      confirmPController: confirmPasswordController,
                      errorMsg: errors['confirmPassword'],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SignupButton(
                        formKey: _formKey,
                        emailController: emailController,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                        instituteNameController: instituteNameController,
                        phoneNumberController: phoneNumberController,
                        userNameController: fullNameController),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: VisitLoginText(),
                  )
                ],
              ),
            ),
          )),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserRegistrationBloc(APIUserRegistrationRepository()),
      child: BlocListener<UserRegistrationBloc, UserRegistrationState>(
        listener: (context, state) async {
            print("daf");
          if (state is VisitLoginScreenState) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginScreen()));
          }
        },
        child: BlocProvider(
          create: (context) =>
              UserRegistrationBloc(APIUserRegistrationRepository()),
          child: BlocBuilder<UserRegistrationBloc, UserRegistrationState>(
              builder: (context, state) {
            if (state is UserRegistrationError) {
              return buildInitial(context, errors: state.errors);
            }
            return buildInitial(context);
          }),
        ),
      ),
    );
  }
}
