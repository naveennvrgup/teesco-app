import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teesco/screens/user_registration/bloc/user_registration_bloc.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required this.emailController,
    @required this.passwordController,
    @required this.confirmPasswordController,
    @required this.instituteNameController,
    @required this.phoneNumberController,
    @required this.userNameController,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController instituteNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController userNameController;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => _onSignupKeyPressed(context),
      child: Text('Sign Up'),
    );
  }

  _onSignupKeyPressed(context) {
      // if (!_formKey.currentState.validate()) return;
      // prepare the data to sent
      dynamic payload = {
        "email": emailController.text,
        "password": passwordController.text,
        "confirmPassword": confirmPasswordController.text,
        "institution": instituteNameController.text,
        "phone": phoneNumberController.text,
        "name": userNameController.text
      };

      print(payload);
      BlocProvider.of<UserRegistrationBloc>(context).add(RegisterUser(payload));
    }
}
