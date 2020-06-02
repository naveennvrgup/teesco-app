import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teesco/screens/login/bloc/login_bloc.dart';

class VisitUserRegisterText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(text: "New to Teesco? "),
            TextSpan(
                text: "Signup",
                style: new TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: new TapGestureRecognizer()
                  ..onTap = () {
                    BlocProvider.of<LoginBloc>(context)
                        .add(VisitUserRegistrationScreen());
                  }),
          ]),
    );
  }
}