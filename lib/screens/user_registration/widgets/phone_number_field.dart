import 'package:flutter/material.dart';

///For Input of Phone number
class PhoneNumberField extends StatelessWidget {
  final TextEditingController controller;
  final String errorMsg;
  PhoneNumberField({@required this.controller, this.errorMsg: ''});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        errorText: this.errorMsg,
        prefixIcon: Icon(Icons.phone),
        border: OutlineInputBorder(),
        prefixText: "+91-",
        hintText: "",
        labelText: "Phone Number",
      ),
    );
  }
}
