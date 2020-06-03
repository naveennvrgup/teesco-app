import 'package:flutter/material.dart';

///For Input of Institution
class InstituteNameField extends StatelessWidget {
  final TextEditingController controller;
  final String errorMsg;
  const InstituteNameField({@required this.controller, this.errorMsg: ''});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        errorText: errorMsg,
        prefixIcon: Icon(Icons.school),
        border: OutlineInputBorder(),
        hintText: "Name of organization",
        labelText: "Institute",
        suffixText: '*',
        suffixStyle: TextStyle(color: Colors.red, fontSize: 20),
      ),
    );
  }
}
