import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teesco/models/user_registration_model.dart';
import 'package:teesco/screens/login/widgets/password_field.dart';
import 'package:teesco/screens/user_registration/bloc/user_registration_bloc.dart';
import 'package:teesco/screens/user_registration/user_registration_repository.dart';
import 'package:teesco/screens/user_registration/widgets/email_input.dart';
import 'package:teesco/screens/user_registration/widgets/institute_name_field.dart';
import 'package:teesco/screens/user_registration/widgets/phone_number_field.dart';
import 'package:teesco/screens/user_registration/widgets/confirm_password_field.dart';

class UserRegistration extends StatelessWidget {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController instituteNameController = TextEditingController();


  Widget buildInitial(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Form(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  controller: userNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    border: OutlineInputBorder(),
                    hintText: "Your name is ...",
                    labelText: "User Name",
                    suffixText: '*',
                    suffixStyle: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: EmailField(emailController),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: InstituteNameField(
                  controller: instituteNameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: PhoneNumberField(controller: phoneNumberController),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: PasswordField(passwordController),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ComnfirmPasswordField(confirmPasswordController),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  onPressed: ()=> _onSignupKeyPresssed(context),
                  child: Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
      )),
    ));
  }

  void _onSignupKeyPresssed(context) {
    final UserRegistrationBloc userRegistrationBloc= BlocProvider.of<UserRegistrationBloc>(context); 
    userRegistrationBloc.add(RegisterUser(UserRegistrationModel()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserRegistrationBloc(APIUserRegistrationRepository()),
          child: BlocBuilder<UserRegistrationBloc, UserRegistrationState>(
          builder: (context, state) {
        return buildInitial(context);
      }),
    );
  }
}
