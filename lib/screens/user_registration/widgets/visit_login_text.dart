import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teesco/screens/user_registration/bloc/user_registration_bloc.dart';

class VisitLoginText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(text: "Already have an account? "),
            TextSpan(
                text: "Login",
                style: new TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: new TapGestureRecognizer()
                  ..onTap = () {
                    BlocProvider.of<UserRegistrationBloc>(context)
                        .add(VisitLoginScreen());
                  }),
          ]),
    );
  }
}
