import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teesco/screens/login/login.dart';
import 'package:teesco/screens/user_registration/widgets/password_field.dart';
import 'package:teesco/screens/user_registration/bloc/user_registration_bloc.dart';
import 'package:teesco/screens/user_registration/user_registration_repository.dart';
import 'package:teesco/screens/user_registration/widgets/confirm_password_field.dart';
import 'package:teesco/screens/user_registration/widgets/email_input.dart';
import 'package:teesco/screens/user_registration/widgets/full_name_field.dart';
import 'package:teesco/screens/user_registration/widgets/institute_name_field.dart';
import 'package:teesco/screens/user_registration/widgets/phone_number_field.dart';
import 'package:teesco/screens/user_registration/widgets/signup_button.dart';

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
    double textFieldMargin = 10.0;

    return Scaffold(
        body: SafeArea(
      child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    FullNameField(
                        fullNameController: fullNameController,
                        errorMsg: errors['name']),
                    SizedBox(
                      height: textFieldMargin,
                    ),
                    EmailField(
                      controller: emailController,
                      errorMsg: errors['email'],
                    ),
                    SizedBox(
                      height: textFieldMargin,
                    ),
                    InstituteNameField(
                      controller: instituteNameController,
                      errorMsg: errors['institution'],
                    ),
                    SizedBox(
                      height: textFieldMargin,
                    ),
                    PhoneNumberField(
                      controller: phoneNumberController,
                      errorMsg: errors['phone'],
                    ),
                    SizedBox(
                      height: textFieldMargin,
                    ),
                    PasswordField(
                      controller: passwordController,
                      errorMsg: errors['password'],
                    ),
                    SizedBox(
                      height: textFieldMargin,
                    ),
                    ComnfirmPasswordField(
                      confirmPController: confirmPasswordController,
                      errorMsg: errors['confirmPassword'],
                    ),
                    SizedBox(
                      height: textFieldMargin,
                    ),
                    SignupButton(
                        formKey: _formKey,
                        emailController: emailController,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                        instituteNameController: instituteNameController,
                        phoneNumberController: phoneNumberController,
                        userNameController: fullNameController),
                  ],
                ),
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
